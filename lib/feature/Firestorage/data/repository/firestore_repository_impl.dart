import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
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
import 'package:dartz/dartz.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  final FirestoreRemoteDataSource dataSource;

  FirestoreRepositoryImpl({required this.dataSource});

  @override
  Future<Either<FirebaseUnknowFailure, void>> createCommentProblem(
      CommentProblemEntity commentProblemEntity) async {
    try {
      return Right(await dataSource.createCommentProblem(
          CommentProblemModel.fromEntity(commentProblemEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure createCommentProblem",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> createCommentSuggestion(
      CommentSuggestionEntity commentSuggestionEntity) async {
    try {
      return Right(await dataSource.createCommentSuggestion(
          CommentSuggestionModel.fromEntity(commentSuggestionEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure createCommentSuggestion",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, String?>> createProfile(
      ProfileEntity profileEntity) async {
    try {
      return Right(await dataSource
          .createProfile(ProfileModel.fromEntity(profileEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure createProfile", message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> createReport(
      ReportEntity reportEntity) async {
    try {
      return Right(
          await dataSource.createReport(ReportModel.fromEntity(reportEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure createReport", message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentProblem(
      String uid) async {
    try {
      return Right(await dataSource.deleteCommentProblem(uid));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure deleteCommentProblem",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> deleteCommentSuggestion(
      String uid) async {
    try {
      return Right(await dataSource.deleteCommentSuggestion(uid));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure deleteCommentSuggestion",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> deleteProfile(String uid) async {
    try {
      return Right(await dataSource.deleteProfile(uid));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure deleteProfile", message: e.toString()));
    }
  }

  @override
  Future<CommentProblemEntity> getCommentProblem(String uid) async {
    return await dataSource.getCommentProblem(uid);
  }

  @override
  Future<List<CommentSuggestionEntity>> getCommentSuggestion(String uid) async {
    return await dataSource.getCommentSuggestions(uid);
  }

  @override
  Future<ProfileEntity> getProfile(String uid) async {
    return await dataSource.getProfile(uid);
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> updateCommentProblem(
      CommentProblemEntity commentProblemEntity) async {
    try {
      return Right(await dataSource.updateCommentProblem(
          CommentProblemModel.fromEntity(commentProblemEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure updateCommentProblem",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> updateCommentSuggestion(
      CommentSuggestionEntity commentSuggestionEntity) async {
    try {
      return Right(await dataSource.updateCommentSuggestion(
          CommentSuggestionModel.fromEntity(commentSuggestionEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure updateCommentSuggestion",
          message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseUnknowFailure, void>> updateProfile(
      ProfileEntity profileEntity) async {
    try {
      return Right(await dataSource
          .updateProfile(ProfileModel.fromEntity(profileEntity)));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure updateProfile", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>,QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToTags(QueryDocumentSnapshot<Object?>? startAfter,{gettingData = 20}) async{
    try {
      return Right(await dataSource.getCommentProblemListAccordingToTags(startAfter,gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListAccordingToTags", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToCategory(CategoriesEnum categoriesEnum, QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20}) async{
    try {
      return Right(await dataSource.getCommentProblemListAccordingToCategory(categoriesEnum, startAfter, gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListAccordingToCategory", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToLikeCount(QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20}) async {
    try {
      return Right(await dataSource.getCommentProblemListAccordingToLikeCount(startAfter, gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListAccordingToLikeCount", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentSuggestionEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentSuggestListAccordingToLikeCount(QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20})async {
    try {
      return Right(await dataSource.getCommentSuggestListAccordingToLikeCount(startAfter, gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentSuggestListAccordingToLikeCount", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentProblemListLast(QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20}) async {
    try {
      return Right(await dataSource.getCommentProblemListLast(startAfter, gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListLast", message: e.toString()));
    }
  }

  @override
  Future<List<File>?> selectFiles(FileType fileType) async{
    
    return await dataSource.selectFiles(fileType);
  }

  @override
  Future<Map<String, List<String>>> uploadFiles(FirestoreAllowedFileTypes firestoreAllowedFileTypes,List<File> files) async{
      
      return await dataSource.uploadFiles(firestoreAllowedFileTypes,files);
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, List<CommentProblemEntity?>?>> getCommentProblemListSearched(List<String> text,{gettingData = 20}) async{
    try {
      return Right(await dataSource.getCommentProblemListSearched(text,gettingData: gettingData));
    } catch (e) {
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListSearched", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentProblemListAccordingToProfileID(String profileID, QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20}) async{
    try{
      return Right(await dataSource.getCommentProblemListAccordingToProfileID(profileID, startAfter, gettingData: gettingData));
    }catch(e){
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentProblemListAccordingToProfileID", message: e.toString()));
    }
  }
  
  @override
  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentSuggestionEntity?>, QueryDocumentSnapshot<Object?>?>>> getCommentSuggestListAccordingToCommentID(String commentID, QueryDocumentSnapshot<Object?>? startAfter, {gettingData = 20}) async{
    try{
      return Right(await dataSource.getCommentSuggestListAccordingToCommentID(commentID, startAfter, gettingData: gettingData));
    }catch(e){
      return Left(FirebaseUnknowFailure(
          title: "FirebaseUnknowFailure getCommentSuggestListAccordingToCommentID", message: e.toString()));
    }
  }
  

}
