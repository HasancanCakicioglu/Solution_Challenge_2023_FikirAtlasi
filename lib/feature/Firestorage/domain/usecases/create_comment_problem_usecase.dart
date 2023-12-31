import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class CreateCommentProblemUsecase{
  final FirestoreRepository repository;

  CreateCommentProblemUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(CommentProblemEntity commentProblemEntity)async {
    return await repository.createCommentProblem(commentProblemEntity);
  }
}