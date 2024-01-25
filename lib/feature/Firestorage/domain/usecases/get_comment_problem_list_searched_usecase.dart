

import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class GetCommentProblemListSearchedUsecase{
  final FirestoreRepository repository;

  GetCommentProblemListSearchedUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, List<CommentProblemEntity?>?>> call(List<String> text,{gettingData = 20})async{
    return await repository.getCommentProblemListSearched(text,gettingData: gettingData);
  }
}