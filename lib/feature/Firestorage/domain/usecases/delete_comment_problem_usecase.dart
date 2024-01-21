import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class DeleteCommentProblemUsecase{
  final FirestoreRepository repository;

  DeleteCommentProblemUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(String uid)async {
    return await repository.deleteCommentProblem(uid);
  }
}