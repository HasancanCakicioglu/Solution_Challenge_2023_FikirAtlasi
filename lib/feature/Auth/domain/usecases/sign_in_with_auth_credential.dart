import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class SignInWithAuthCredentialUsecase{
  final AuthRepository repository;

  SignInWithAuthCredentialUsecase(this.repository);

  Future<UserCredential> call(AuthCredential credential){
    return repository.signInWithAuthCredential(credential);
  }
}