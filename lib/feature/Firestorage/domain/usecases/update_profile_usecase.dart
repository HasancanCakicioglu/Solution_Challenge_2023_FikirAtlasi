import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class UpdateProfileUsecase{
  final FirestoreRepository repository;

  UpdateProfileUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(ProfileEntity profileEntity)async {
    return await repository.updateProfile(profileEntity);
  }
}