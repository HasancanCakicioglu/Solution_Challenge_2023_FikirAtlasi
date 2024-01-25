

import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class CreateProfileUsecase{
  final FirestoreRepository repository;

  CreateProfileUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, String?>> call(ProfileEntity profileEntity)async {
    return await repository.createProfile(profileEntity);
  }
}






