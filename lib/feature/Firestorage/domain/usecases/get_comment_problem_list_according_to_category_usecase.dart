
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class GetCommentProblemListAccordingToCategoryUsecase{
  final FirestoreRepository repository;

  GetCommentProblemListAccordingToCategoryUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, Tuple2<List<CommentProblemEntity?>,QueryDocumentSnapshot<Object?>?>>> call(CategoriesEnum categoriesEnum,QueryDocumentSnapshot<Object?>? startAfter,{gettingData = 20}) async {
    return await repository.getCommentProblemListAccordingToCategory(categoriesEnum, startAfter,gettingData: gettingData);
  }
}