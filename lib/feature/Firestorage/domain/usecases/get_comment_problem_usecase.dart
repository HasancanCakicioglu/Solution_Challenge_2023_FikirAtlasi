import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class GetCommentProblemUsecase{
  final FirestoreRepository repository;

  GetCommentProblemUsecase(this.repository);

  Future<CommentProblemEntity> call(String uid)async {
    return await repository.getCommentProblem(uid);
  }
}