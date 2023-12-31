import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class UpdateCommentSuggestionUsecase{
  final FirestoreRepository repository;

  UpdateCommentSuggestionUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(CommentSuggestionEntity commentSuggestionEntity)async {
    return await repository.updateCommentSuggestion(commentSuggestionEntity);
  }
}