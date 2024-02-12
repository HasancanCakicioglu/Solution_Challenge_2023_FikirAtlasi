import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';


/// The abstract class defining methods to interact with Firestore.
abstract class FirestoreRepository {
  /// Creates a new profile entity in Firestore.
  Future<Either<FirebaseUnknowFailure, String?>> createProfile(
      ProfileEntity profileEntity);

  /// Updates an existing profile entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> updateProfile(
      ProfileEntity profileEntity);

  /// Retrieves a profile entity from Firestore based on its UID.
  Future<ProfileEntity> getProfile(String uid);

  /// Deletes a profile entity from Firestore based on its UID.
  Future<Either<FirebaseUnknowFailure, void>> deleteProfile(String uid);

  /// Creates a new comment problem entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> createCommentProblem(
      CommentProblemEntity commentProblemEntity);

  /// Updates an existing comment problem entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> updateCommentProblem(
      CommentProblemEntity commentProblemEntity);

  /// Retrieves a comment problem entity from Firestore based on its UID.
  Future<CommentProblemEntity> getCommentProblem(String uid);

  /// Deletes a comment problem entity from Firestore based on its UID.
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentProblem(String uid);

  /// Retrieves a list of comment problem entities from Firestore filtered by tags.
  Future<
          Either<
              FirebaseUnknowFailure,
              Tuple2<List<CommentProblemEntity?>,
                  QueryDocumentSnapshot<Object?>?>>>
      getCommentProblemListAccordingToTags(
          QueryDocumentSnapshot<Object?>? startAfter,
          {int gettingData = 20});

  /// Retrieves a list of comment problem entities from Firestore filtered by category.
  Future<
          Either<
              FirebaseUnknowFailure,
              Tuple2<List<CommentProblemEntity?>,
                  QueryDocumentSnapshot<Object?>?>>>
      getCommentProblemListAccordingToCategory(CategoriesEnum categoriesEnum,
          QueryDocumentSnapshot<Object?>? startAfter,
          {int gettingData = 20});

  /// Retrieves a list of comment problem entities from Firestore sorted by like count.
  Future<
          Either<
              FirebaseUnknowFailure,
              Tuple2<List<CommentProblemEntity?>,
                  QueryDocumentSnapshot<Object?>?>>>
      getCommentProblemListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {int gettingData = 20});

  /// Retrieves a list of comment problem entities from Firestore filtered by profile ID.
  Future<
      Either<
          FirebaseUnknowFailure,
          Tuple2<List<CommentProblemEntity?>,
              QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToProfileID(
      String profileID, QueryDocumentSnapshot<Object?>? startAfter,
      {int gettingData = 20});

  /// Retrieves the last batch of comment problem entities from Firestore.
  Future<
      Either<
          FirebaseUnknowFailure,
          Tuple2<List<CommentProblemEntity?>,
              QueryDocumentSnapshot<Object?>?>>> getCommentProblemListLast(
      QueryDocumentSnapshot<Object?>? startAfter,
      {int gettingData = 20});

  /// Retrieves a list of comment problem entities from Firestore based on a search text.
  Future<Either<FirebaseUnknowFailure, List<CommentProblemEntity?>?>>
      getCommentProblemListSearched(List<String> text,
          {int gettingData = 20});

  /// Retrieves a list of comment suggestion entities from Firestore based on a comment UID.
  Future<List<CommentSuggestionEntity>> getCommentSuggestion(String uid);

  /// Creates a new comment suggestion entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> createCommentSuggestion(
      CommentSuggestionEntity commentSuggestionEntity);

  /// Updates an existing comment suggestion entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> updateCommentSuggestion(
      CommentSuggestionEntity commentSuggestionEntity);

  /// Deletes a comment suggestion entity from Firestore based on its UID.
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentSuggestion(
      String uid);

  /// Retrieves a list of comment suggestion entities from Firestore sorted by like count.
  Future<
          Either<
              FirebaseUnknowFailure,
              Tuple2<List<CommentSuggestionEntity?>,
                  QueryDocumentSnapshot<Object?>?>>>
      getCommentSuggestListAccordingToLikeCount(
          QueryDocumentSnapshot<Object?>? startAfter,
          {int gettingData = 20});

  /// Retrieves a list of comment suggestion entities from Firestore based on a comment UID.
  Future<
          Either<
              FirebaseUnknowFailure,
              Tuple2<List<CommentSuggestionEntity?>,
                  QueryDocumentSnapshot<Object?>?>>>
      getCommentSuggestListAccordingToCommentID(String commentID,
          QueryDocumentSnapshot<Object?>? startAfter,
          {int gettingData = 20});

  /// Creates a new report entity in Firestore.
  Future<Either<FirebaseUnknowFailure, void>> createReport(
      ReportEntity reportEntity);

  /// Selects files from the device storage.
  Future<List<File>?> selectFiles(FileType fileType);

  /// Uploads files to Firestore.
  Future<Map<String, List<String>>> uploadFiles(
      FirestoreAllowedFileTypes firestoreAllowedFileTypes, List<File> files);

  /// Likes or unlikes a comment problem based on the provided comment ID and like status.
  Future<Either<FirebaseUnknowFailure, void>> commentProblemLike(
      String commentID, bool isLike);

  /// Likes or unlikes a comment solution based on the provided solution ID and like status.
  Future<Either<FirebaseUnknowFailure, void>> commentSolutionLike(
      String solutionID, bool isLike);

  /// Adds clicked content to the profile's last viewed comments
  Future<void> profileLastLookedContents(CommentProblemEntity commentProblemEntity);
}

