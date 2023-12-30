

import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';

abstract class FirestoreRepository {

  Future<void> createProfile(ProfileEntity profileEntity);
  Future<void> updateProfile(ProfileEntity profileEntity);
  Future<ProfileEntity> getProfile(String uid);
  Future<void> deleteProfile(String uid);


  Future<void> createCommentProblem(CommentProblemEntity commentProblemEntity);
  Future<void> updateCommentProblem(CommentProblemEntity commentProblemEntity);
  Future<CommentProblemEntity> getCommentProblem(String uid);
  Future<void> deleteCommentProblem(String uid);


  Future<List<CommentSuggestionEntity>> getCommentSuggestion(String uid);
  Future<void> createCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity);
  Future<void> updateCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity);
  Future<void> deleteCommentSuggestion(String uid);


  Future<void> createReport(ReportEntity reportEntity);

  
}

