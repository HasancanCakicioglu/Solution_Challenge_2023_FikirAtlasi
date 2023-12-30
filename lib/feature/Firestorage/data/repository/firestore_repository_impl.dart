

import 'dart:async';

import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/datasource/remote_datasource/firestore_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_problem_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/comments_suggestions_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/profile_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/models/report_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirestoreRemoteDataSource dataSource;

  FirestoreRepositoryImpl({required this.dataSource});
  
  @override
  Future<void> createCommentProblem(CommentProblemEntity commentProblemEntity)async {
    await dataSource.createCommentProblem(CommentProblemModel.fromEntity(commentProblemEntity));
  }
  
  @override
  Future<void> createCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity)async {
    await dataSource.createCommentSuggestion(CommentSuggestionModel.fromEntity(commentSuggestionEntity));
  }
  
  @override
  Future<void> createProfile(ProfileEntity profileEntity) async {
    await dataSource.createProfile(ProfileModel.fromEntity(profileEntity));
  }
  
  @override
  Future<void> createReport(ReportEntity reportEntity)async {
    await dataSource.createReport(ReportModel.fromEntity(reportEntity));
  }
  
  @override
  Future<void> deleteCommentProblem(String uid) async{
    await dataSource.deleteCommentProblem(uid);
  }
  
  @override
  Future<void> deleteCommentSuggestion(String uid) async{
    await dataSource.deleteCommentSuggestion(uid);
  }
  
  @override
  Future<void> deleteProfile(String uid) async{
    await dataSource.deleteProfile(uid);
  }
  
  @override
  Future<CommentProblemEntity> getCommentProblem(String uid) async{
    return await dataSource.getCommentProblem(uid);
  }
  
  @override
  Future<List<CommentSuggestionEntity>> getCommentSuggestion(String uid) async{
    return await dataSource.getCommentSuggestions(uid);
  }
  
  @override
  Future<ProfileEntity> getProfile(String uid) async{
    return await dataSource.getProfile(uid);
  }
  
  @override
  Future<void> updateCommentProblem(CommentProblemEntity commentProblemEntity) async{
    await dataSource.updateCommentProblem(CommentProblemModel.fromEntity(commentProblemEntity));
  }
  
  @override
  Future<void> updateCommentSuggestion(CommentSuggestionEntity commentSuggestionEntity) async{
    await dataSource.updateCommentSuggestion(CommentSuggestionModel.fromEntity(commentSuggestionEntity));
  }
  
  @override
  Future<void> updateProfile(ProfileEntity profileEntity) async{
    await dataSource.updateProfile(ProfileModel.fromEntity(profileEntity));
  }
  

}