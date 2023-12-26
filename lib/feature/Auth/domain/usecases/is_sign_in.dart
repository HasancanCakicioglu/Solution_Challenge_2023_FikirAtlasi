

import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class IsSignInUsecase{
  final AuthRepository repository;

  IsSignInUsecase(this.repository);

  Future<bool> call(){
    return repository.isSignIn();
  }
}