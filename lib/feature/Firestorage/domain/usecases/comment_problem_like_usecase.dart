import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class CommentProblemLikeUsecase {
  final FirestoreRepository repository;

  CommentProblemLikeUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(
      String commentID, bool isLike) async {
    return await repository.commentProblemLike(commentID, isLike);
  }
}
