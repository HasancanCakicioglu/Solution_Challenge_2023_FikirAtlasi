import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class GetProfileUsecase{
  final FirestoreRepository repository;

  GetProfileUsecase(this.repository);

  Future<ProfileEntity> call(String uid)async {
    return await repository.getProfile(uid);
  }
}