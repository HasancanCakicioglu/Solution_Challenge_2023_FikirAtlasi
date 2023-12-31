import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/firestore/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_problem_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_suggestions_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/profile_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/report_model.dart';

abstract class FirestoreRemoteDataSource {
  Future<void> createProfile(ProfileModel profileModel);
  Future<void> updateProfile(ProfileModel profileModel);
  Future<ProfileModel> getProfile(String uid);
  Future<void> deleteProfile(String uid);
  Future<void> createCommentProblem(CommentProblemModel commentProblemModel);
  Future<void> updateCommentProblem(CommentProblemModel commentProblemModel);
  Future<CommentProblemModel> getCommentProblem(String uid);
  Future<void> deleteCommentProblem(String uid);
  Future<List<CommentSuggestionModel>> getCommentSuggestions(String uid);
  Future<void> createCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel);
  Future<void> updateCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel);
  Future<void> deleteCommentSuggestion(String uid);
  Future<void> createReport(ReportModel reportModel);
  Future<Tuple2<List<CommentProblemModel?>,QueryDocumentSnapshot<Object?>?>> getCommentProblemListAccordingToTags(List<String> tags,QueryDocumentSnapshot<Object?>? startAfter,{gettingData = 20});
}

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> createCommentProblem(
      CommentProblemModel commentProblemModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .add(commentProblemModel.toJson());
  }

  @override
  Future<void> createCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .add(commentSuggestionModel.toJson());
  }

  @override
  Future<ProfileModel?> createProfile(ProfileModel profileModel) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;

      DocumentSnapshot documentSnapshot = await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .get();

      if (documentSnapshot.exists) {
        return null;
      }

      await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .set(profileModel.toJson());

      return profileModel.copyWith(uid: uid);
    }

    return profileModel;
  }

  @override
  Future<void> createReport(ReportModel reportModel) async {
    await firestore
        .collection(FirestoreConstants.collectionReports)
        .add(reportModel.toJson());
  }

  @override
  Future<void> deleteCommentProblem(String uid) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(uid)
        .delete();
  }

  @override
  Future<void> deleteCommentSuggestion(String uid) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(uid)
        .delete();
  }

  @override
  Future<void> deleteProfile(String uid) async {
    await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(uid)
        .delete();
  }

  @override
  Future<CommentProblemModel> getCommentProblem(String uid) async {
    DocumentSnapshot documentSnapshot = await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(uid)
        .get();

    return CommentProblemModel.fromJson(
        documentSnapshot.data() as Map<String, dynamic>);
  }

  @override
  Future<List<CommentSuggestionModel>> getCommentSuggestions(String uid) async {
    QuerySnapshot querySnapshot = await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .where('uid', isEqualTo: uid)
        .get();

    return querySnapshot.docs
        .map((e) =>
            CommentSuggestionModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ProfileModel> getProfile(String uid) async {
    DocumentSnapshot documentSnapshot = await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(uid)
        .get();

    return ProfileModel.fromJson(
        documentSnapshot.data() as Map<String, dynamic>);
  }

  @override
  Future<CommentProblemModel> updateCommentProblem(
      CommentProblemModel commentProblemModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(commentProblemModel.uid)
        .update(commentProblemModel.toJson());

    return commentProblemModel;
  }

  @override
  Future<CommentSuggestionModel> updateCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(commentSuggestionModel.uid)
        .update(commentSuggestionModel.toJson());

    return commentSuggestionModel;
  }

  @override
  Future<void> updateProfile(ProfileModel profileModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(profileModel.uid)
        .update(profileModel.toJson());
  }
  
  @override
  Future<Tuple2<List<CommentProblemModel?>,QueryDocumentSnapshot<Object?>?>> getCommentProblemListAccordingToTags(List<String> tags,QueryDocumentSnapshot<Object?>? startAfter,{ gettingData = 20}) async{
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .where('tags', arrayContainsAny: tags)
        .orderBy('date',descending: true);
    print("1");
    if(startAfter != null){
      print("2");
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
        .get();
    }else{
      print("3");
      querySnapshot = await queryOrders
          .limit(gettingData)
          .get();
    }

    print("4");
    QueryDocumentSnapshot<Object?>? lastQuery=querySnapshot.docs.last;
    print("5");
    print(querySnapshot.docs);
    return Tuple2(querySnapshot.docs
        .map((e) =>
            CommentProblemModel.fromJson(e.data()))
        .toList(),lastQuery);

  }
}
