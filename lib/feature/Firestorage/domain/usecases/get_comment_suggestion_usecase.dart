import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class GetCommentSuggestionUsecase{
  final FirestoreRepository repository;

  GetCommentSuggestionUsecase(this.repository);

  Future<List<CommentSuggestionEntity>> call(String uid)async {
    return await repository.getCommentSuggestion(uid);
  }
}