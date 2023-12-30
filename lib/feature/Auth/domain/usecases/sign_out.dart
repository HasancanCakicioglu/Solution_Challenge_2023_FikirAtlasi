

import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class SignOutUsecase{
  final AuthRepository repository;

  SignOutUsecase(this.repository);

  Future<void> call(){
    return repository.signOut();
  }
}