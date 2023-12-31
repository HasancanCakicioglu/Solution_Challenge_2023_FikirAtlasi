

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';

abstract class FirestoreRepository {

  Future<Either<FirebaseUnknowFailure, void>> createProfile(ProfileEntity profileEntity);
  Future<Either<FirebaseUnknowFailure, void>> updateProfile(ProfileEntity profileEntity);
  Future<ProfileEntity> getProfile(String uid);
  Future<Either<FirebaseUnknowFailure, void>> deleteProfile(String uid);


  Future<Either<FirebaseUnknowFailure, void>> createCommentProblem(CommentProblemEntity commentProblemEntity);
  Future<Either<FirebaseUnknowFailure, void>> updateCommentProblem(CommentProblemEntity commentProblemEntity);
  Future<CommentProblemEntity> getCommentProblem(String uid);
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentProblem(String uid);

  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>,QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToTags(List<String> tags,QueryDocumentSnapshot<Object?>? startAfter,{gettingData = 20});


  Future<List<CommentSuggestionEntity>> getCommentSuggestion(String uid);
  Future<Either<FirebaseUnknowFailure, void>> createCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity);
  Future<Either<FirebaseUnknowFailure, void>> updateCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity);
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentSuggestion(String uid);


  Future<Either<FirebaseUnknowFailure, void>> createReport(ReportEntity reportEntity);

  
}

