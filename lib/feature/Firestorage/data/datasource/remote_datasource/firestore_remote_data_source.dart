import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/firestore/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/helper_class.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_problem_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_suggestions_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/profile_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/report_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

abstract class FirestoreRemoteDataSource {
  Future<String?> createProfile(ProfileModel profileModel);
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
  Future<Tuple2<List<CommentProblemModel?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToTags(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToCategory(CategoriesEnum categoriesEnum,
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>>>
      getCommentProblemListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});
  Future<
          Tuple2<List<CommentSuggestionEntity?>,
              QueryDocumentSnapshot<Object?>?>>
      getCommentSuggestListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListLast(QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToProfileID(
          String profileID, QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  Future<List<CommentProblemEntity?>?> getCommentProblemListSearched(
      List<String> text,
      {gettingData = 20});

  Future<List<File>?> selectFiles();
  Future<Map<String, List<String>>> uploadFiles(
      FirestoreAllowedFileTypes firestoreAllowedFileTypes, List<File> files);
}

class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> createCommentProblem(
      CommentProblemModel commentProblemModel) async {
    String customID = HelperClass.getUuid();
    print("geldi");
    print(commentProblemModel);
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(customID)
        .set(commentProblemModel
            .copyWith(
                uid: customID,
                date: DateTime.now().toIso8601String(),
                likeCount: 0,
                profileId: firebaseAuth.currentUser!.uid)
            .toJson())
        .catchError((e) {
      print(e);
    });
  }

  @override
  Future<void> createCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .add(commentSuggestionModel.toJson());
  }

  @override
  Future<String?> createProfile(ProfileModel profileModel) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      DocumentSnapshot documentSnapshot = await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .get();

      if (documentSnapshot.exists) {
        return uid;
      }

      await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .set(profileModel.copyWith(uid: uid).toJson());

      return uid;
    }

    return null;
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
  Future<Tuple2<List<CommentProblemModel?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToTags(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    List<String>? tags = [];
    DocumentSnapshot documentSnapshot = await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    if (documentSnapshot.exists) {
      tags = documentSnapshot["lastLookedContents"].cast<String>();
    }

    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    late Query<Map<String, dynamic>> queryOrders;
    if (tags!.isEmpty) {
      queryOrders = firestore
          .collection(FirestoreConstants.collectionCommentsProblems)
          .orderBy('date', descending: true);
    } else {
      queryOrders = firestore
          .collection(FirestoreConstants.collectionCommentsProblems)
          .where('tags', arrayContainsAny: tags)
          .orderBy('date', descending: true);
    }

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;
    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentProblemModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }

  @override
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToCategory(CategoriesEnum categoriesEnum,
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .where('category', isEqualTo: categoriesEnum.value)
        .orderBy('date', descending: true);

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;

    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentProblemModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }

  @override
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>>>
      getCommentProblemListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .orderBy('likeCount', descending: true);

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;

    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentProblemModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }

  @override
  Future<
          Tuple2<List<CommentSuggestionEntity?>,
              QueryDocumentSnapshot<Object?>?>>
      getCommentSuggestListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .orderBy('likeCount', descending: true);

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;

    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentSuggestionModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }

  @override
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListLast(QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .orderBy('date', descending: true);

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;

    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentProblemModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }

  @override
  Future<List<File>?> selectFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return null;
    }
  }

  @override
  Future<Map<String, List<String>>> uploadFiles(
      FirestoreAllowedFileTypes firestoreAllowedFileTypes,
      List<File> files) async {
    Map<String, List<String>> links = {};

    for (var file in files) {
      String ex = p.extension(file.path);
      String timestamp = Timestamp.now().millisecondsSinceEpoch.toString();
      String uploadFileName = "${timestamp}_${HelperClass.getUuid()}$ex";
      Reference reference = firebaseStorage.ref().child(uploadFileName);

      UploadTask uploadTask = reference.putFile(file);

      await uploadTask.whenComplete(() async {
        await uploadTask.snapshot.ref.getDownloadURL().then((value) {
          String key = p.extension(file.path);
          if (links.containsKey(key)) {
            links[key]!.add(value);
          } else {
            links[key] = [value];
          }
        });
      });
    }

    return links;
  }

  @override
  Future<List<CommentProblemEntity?>?> getCommentProblemListSearched(
      List<String> text,
      {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .where('uid', whereIn: text);

    querySnapshot = await queryOrders.limit(gettingData).get();

    return querySnapshot.docs
        .map((e) => CommentProblemModel.fromJson(e.data()))
        .toList();
  }

  @override
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToProfileID(
          String profileID, QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .where('profileId', isEqualTo: profileID)
        .orderBy('date', descending: true);

    if (startAfter != null) {
      querySnapshot = await queryOrders
          .startAfterDocument(startAfter)
          .limit(gettingData)
          .get();
    } else {
      querySnapshot = await queryOrders.limit(gettingData).get();
    }

    QueryDocumentSnapshot<Object?>? lastQuery = querySnapshot.docs.last;

    return Tuple2(
        querySnapshot.docs
            .map((e) => CommentProblemModel.fromJson(e.data()))
            .toList(),
        lastQuery);
  }
}
