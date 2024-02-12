import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class ProfileLastLookedContentsUsecase{
  final FirestoreRepository repository;

  ProfileLastLookedContentsUsecase(this.repository);

  Future<void> call(CommentProblemEntity commentProblemEntity) async {
    return await repository.profileLastLookedContents(commentProblemEntity);
  }
}