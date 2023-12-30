

import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class SignInWithGoogleUsecase{
  final AuthRepository repository;

  SignInWithGoogleUsecase(this.repository);

  Future<void> call(){
    return repository.signInWithGoogle();
  }
}