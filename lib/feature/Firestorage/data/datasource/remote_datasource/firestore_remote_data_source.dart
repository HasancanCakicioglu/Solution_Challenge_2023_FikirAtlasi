import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/firestore/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_problem_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_suggestions_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/profile_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/report_model.dart';


abstract class FirestoreRemoteDataSource {
  Future<ProfileModel?> createProfile(ProfileModel profileModel);
  Future<void> updateProfile(ProfileModel profileModel);
  Future<ProfileModel> getProfile(String uid);
  Future<void> deleteProfile(String uid);
  Future<void> createCommentProblem(CommentProblemModel commentProblemModel);
  Future<void> updateCommentProblem(CommentProblemModel commentProblemModel);
  Future<CommentProblemModel> getCommentProblem(String uid);
  Future<void> deleteCommentProblem(String uid);
  Future<List<CommentSuggestionModel>> getCommentSuggestions(String uid);
  Future<void> createCommentSuggestion(CommentSuggestionModel commentSuggestionModel);
  Future<void> updateCommentSuggestion(CommentSuggestionModel commentSuggestionModel);
  Future<void> deleteCommentSuggestion(String uid);
  Future<void> createReport(ReportModel reportModel);

}

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  @override
  Future<void> createCommentProblem(CommentProblemModel commentProblemModel) async {
    
    
      await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .add(commentProblemModel.toJson());
    
        
  
  }

  @override
  Future<void> createCommentSuggestion(CommentSuggestionModel commentSuggestionModel) async{
    
      await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .add(commentSuggestionModel.toJson());
    
  }

  @override
  Future<ProfileModel?> createProfile(ProfileModel profileModel) async{
    
      DocumentReference documentReference =  await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .add(profileModel.toJson());

      return profileModel.copyWith(uid: documentReference.id);
    
  }

  @override
  Future<void> createReport(ReportModel reportModel) async{
    
      await firestore
        .collection(FirestoreConstants.collectionReports)
        .add(reportModel.toJson());
    
  
  }

  @override
  Future<void> deleteCommentProblem(String uid) async{
    
      await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(uid)
        .delete();
    
  }

  @override
  Future<void> deleteCommentSuggestion(String uid) async{
    
      await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(uid)
        .delete();
    
  }

  @override
  Future<void> deleteProfile(String uid) async{
    
      await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(uid)
        .delete();
    
  }

  @override
  Future<CommentProblemModel> getCommentProblem(String uid) async{
    
      DocumentSnapshot documentSnapshot = await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(uid)
        .get();

      return CommentProblemModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    
  }

  @override
  Future<List<CommentSuggestionModel>> getCommentSuggestions(String uid) async{
    
      QuerySnapshot querySnapshot = await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .where('uid', isEqualTo: uid)
        .get();

      return querySnapshot.docs.map((e) => CommentSuggestionModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    
  }

  @override
  Future<ProfileModel> getProfile(String uid) async{
    
      DocumentSnapshot documentSnapshot = await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(uid)
        .get();

      return ProfileModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    
  }

  @override
  Future<CommentProblemModel> updateCommentProblem(CommentProblemModel commentProblemModel) async{
    
      await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(commentProblemModel.uid)
        .update(commentProblemModel.toJson());

      return commentProblemModel;
    
  }

  @override
  Future<CommentSuggestionModel> updateCommentSuggestion(CommentSuggestionModel commentSuggestionModel) async{
    
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
  
}


