// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/file_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/firestore/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/helper_class.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_problem_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_suggestions_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/profile_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/report_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

/// An abstract class representing a remote data source for Firestore operations.
abstract class FirestoreRemoteDataSource {
  /// Creates a new profile in Firestore.
  Future<String?> createProfile(ProfileModel profileModel);

  /// Updates an existing profile in Firestore.
  Future<void> updateProfile(ProfileModel profileModel);

  /// Retrieves a profile from Firestore based on the provided user ID.
  Future<ProfileModel> getProfile(String uid);

  /// Deletes a profile from Firestore based on the provided user ID.
  Future<void> deleteProfile(String uid);

  /// Creates a new comment for a problem in Firestore.
  Future<void> createCommentProblem(CommentProblemModel commentProblemModel);

  /// Updates an existing comment for a problem in Firestore.
  Future<void> updateCommentProblem(CommentProblemModel commentProblemModel);

  /// Retrieves a comment for a problem from Firestore based on the provided ID.
  Future<CommentProblemModel> getCommentProblem(String uid);

  /// Deletes a comment for a problem from Firestore based on the provided ID.
  Future<void> deleteCommentProblem(String uid);

  /// Retrieves a list of comment suggestions from Firestore based on the provided user ID.
  Future<List<CommentSuggestionModel>> getCommentSuggestions(String uid);

  /// Creates a new comment suggestion in Firestore.
  Future<void> createCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel);

  /// Updates an existing comment suggestion in Firestore.
  Future<void> updateCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel);

  /// Deletes a comment suggestion from Firestore based on the provided ID.
  Future<void> deleteCommentSuggestion(String uid);

  /// Creates a new report in Firestore.
  Future<void> createReport(ReportModel reportModel);

  /// Retrieves a list of comment problems from Firestore based on the provided startAfter snapshot and optional data limit.
  Future<Tuple2<List<CommentProblemModel?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToTags(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves a list of comment problems from Firestore based on the provided category and optional startAfter snapshot and data limit.
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToCategory(CategoriesEnum categoriesEnum,
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves a list of comment problems from Firestore based on the like count and optional startAfter snapshot and data limit.
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves a list of comment suggestions from Firestore based on the like count and optional startAfter snapshot and data limit.
  Future<
          Tuple2<List<CommentSuggestionEntity?>,
              QueryDocumentSnapshot<Object?>?>>
      getCommentSuggestListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves the last page of comment problems from Firestore based on the optional startAfter snapshot and data limit.
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListLast(QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves a list of comment problems from Firestore based on the provided profile ID, optional startAfter snapshot, and data limit.
  Future<Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>
      getCommentProblemListAccordingToProfileID(
          String profileID, QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Retrieves a list of comment problems from Firestore based on the provided search text and optional data limit.
  Future<List<CommentProblemEntity?>?> getCommentProblemListSearched(
      List<String> text,
      {gettingData = 20});

  /// Opens the file picker to select files of the specified type.
  Future<List<File>?> selectFiles(FileType fileType);

  /// Uploads the selected files to Firebase Storage and returns a map of download links.
  Future<Map<String, List<String>>> uploadFiles(
      FirestoreAllowedFileTypes firestoreAllowedFileTypes, List<File> files);

  /// Retrieves a list of comment suggestions from Firestore based on the provided comment ID, optional startAfter snapshot, and data limit.
  Future<
          Tuple2<List<CommentSuggestionEntity?>,
              QueryDocumentSnapshot<Object?>?>>
      getCommentSuggestListAccordingToCommentID(
          String commentID, QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20});

  /// Likes or unlikes a comment problem in Firestore based on the provided comment ID and like status.
  Future<void> commentProblemLike(String commentID, bool isLike);

  /// Likes or unlikes a comment solution in Firestore based on the provided solution ID and like status.
  Future<void> commentSolutionLike(String solutionID, bool isLike);

  /// Adds clicked content to the profile's last viewed comments
  Future<void> profileLastLookedContents(
      CommentProblemEntity commentProblemEntity);
}

/// Implementation of [FirestoreRemoteDataSource] responsible for performing Firestore operations.
class FirestoreRemoteDataSourceImpl implements FirestoreRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> createCommentProblem(
      CommentProblemModel commentProblemModel) async {
    String customID = HelperClass.getUuid();

    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(customID)
        .set(commentProblemModel
            .copyWith(
                uid: customID,
                date: DateTime.now().toIso8601String(),
                likeCount: 0,
                solutionCount: 0,
                profileId: firebaseAuth.currentUser!.uid)
            .toJson());
  }

  @override
  Future<void> createCommentSuggestion(
      CommentSuggestionModel commentSuggestionModel) async {
    String customID = HelperClass.getUuid();

    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(customID)
        .set(commentSuggestionModel
            .copyWith(
              date: DateTime.now().toIso8601String(),
              uid: customID,
              profileId: firebaseAuth.currentUser!.uid,
              profileImage: commentSuggestionModel.profileImage ??
                  firebaseAuth.currentUser!.photoURL ??
                  "",
              profileName: commentSuggestionModel.profileName ??
                  firebaseAuth.currentUser!.displayName ??
                  "",
              likeCount: 0,
            )
            .toJson());
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(commentSuggestionModel.commentProblemID)
        .update({
      'solutionCount': FieldValue.increment(1),
    });
  }

  @override
  Future<String?> createProfile(ProfileModel profileModel) async {
    User? user = firebaseAuth.currentUser;
    if (user == null) {}
    if (user != null) {
      String uid = user.uid;
      DocumentSnapshot documentSnapshot = await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .get();

      if (documentSnapshot.exists) {
        return uid;
      }
      String? fmcToken = await firebaseMessaging.getToken();

      await firestore
          .collection(FirestoreConstants.collectionProfiles)
          .doc(uid)
          .set(profileModel
              .copyWith(
                  uid: uid,
                  fcmToken: fmcToken,
                  email: user.email,
                  name: user.displayName,
                  profileUrl: user.photoURL)
              .toJson());

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
        .collection(FirestoreConstants.collectionProfiles)
        .doc(firebaseAuth.currentUser!.uid)
        .set(profileModel.toJson(), SetOptions(merge: true));
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
      try {
        //tags = documentSnapshot.get('lastLookedContents').cast<String>();
        tags = ProfileModel.fromJson(
                    documentSnapshot.data() as Map<String, dynamic>)
                .lastLookedContents ??
            [];
      } catch (e) {
        tags = [];
      }
    }

    late QuerySnapshot<Map<String, dynamic>> querySnapshot;
    late Query<Map<String, dynamic>> queryOrders;
    if (tags.isEmpty) {
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
  Future<List<File>?> selectFiles(FileType fileType) async {
    late FilePickerResult? result;
    if (fileType == FileType.custom) {
      result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: true,
        allowedExtensions: ["pdf"],
      );
    } else {
      result = await FilePicker.platform.pickFiles(
        type: fileType,
        allowMultiple: true,
      );
    }

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
      String fileName = p.basename(file.path).split(".")[0];
      String timestamp = Timestamp.now().millisecondsSinceEpoch.toString();
      String uploadFileName =
          "${fileName}_${timestamp}_${HelperClass.getUuid()}$ex";
      Reference reference = firebaseStorage.ref().child(uploadFileName);

      if (file.isImage) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;

        String targetPath =
            '$appDocPath/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg';

        var result = await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          targetPath,
          quality: 10,
        );
        if (result != null) {
          file = File(result.path);
        }
      }

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

  @override
  Future<
          Tuple2<List<CommentSuggestionEntity?>,
              QueryDocumentSnapshot<Object?>?>>
      getCommentSuggestListAccordingToCommentID(
          String commentID, QueryDocumentSnapshot<Object?>? startAfter,
          {gettingData = 20}) async {
    late QuerySnapshot<Map<String, dynamic>> querySnapshot;

    Query<Map<String, dynamic>> queryOrders = firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .where('commentProblemID', isEqualTo: commentID)
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
  Future<void> commentProblemLike(String commentID, bool isLike) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsProblems)
        .doc(commentID)
        .update({
      'likeCount': FieldValue.increment(isLike ? 1 : -1),
    });

    
      await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      "problemIDs": isLike ? FieldValue.arrayUnion([commentID]) : FieldValue.arrayRemove([commentID]),
    });

    
  }

  @override
  Future<void> commentSolutionLike(String solutionID, bool isLike) async {
    await firestore
        .collection(FirestoreConstants.collectionCommentsSuggestions)
        .doc(solutionID)
        .update({
      'likeCount': FieldValue.increment(isLike ? 1 : -1),
    });

    await firestore
        .collection(FirestoreConstants.collectionProfiles)
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      "solutionIDs": isLike ?  FieldValue.arrayUnion([solutionID]) : FieldValue.arrayRemove([solutionID]),
    });
  }

  @override
  Future<void> profileLastLookedContents(
      CommentProblemEntity commentProblemEntity) async {
    final CollectionReference profilesRef = FirebaseFirestore.instance
        .collection(FirestoreConstants.collectionProfiles);
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot profileSnapshot =
        await profilesRef.doc(currentUserId).get();


    if (profileSnapshot.exists) {
      final lastLookedContents =
          ProfileModel.fromJson(profileSnapshot.data() as Map<String, dynamic>)
                  .lastLookedContents ??
              [];

      lastLookedContents.addAll(commentProblemEntity.tags ?? []);

      lastLookedContents.toSet().toList();

      if (lastLookedContents.length > 30) {
        int excessCount = lastLookedContents.length - 30;
        lastLookedContents.removeRange(0, excessCount);
      }

      await profilesRef
          .doc(currentUserId)
          .update({'lastLookedContents': lastLookedContents});
    }
  }
}
