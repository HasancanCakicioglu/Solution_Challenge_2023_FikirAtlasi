
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';



class GetCommentSuggestionListAccordingToLikeCountUseCase{
  final FirestoreRepository repository;

  GetCommentSuggestionListAccordingToLikeCountUseCase(this.repository);

  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentSuggestionEntity?>,QueryDocumentSnapshot<Object?>?>>> call(QueryDocumentSnapshot<Object?>? startAfter,{gettingData = 20}) async {
    return await repository.getCommentSuggestListAccordingToLikeCount(startAfter,gettingData: gettingData);
  }
}