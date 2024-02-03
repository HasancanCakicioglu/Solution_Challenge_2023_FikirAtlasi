import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class SignInWithEmailAndPasswordUsecase{
  final AuthRepository repository;

  SignInWithEmailAndPasswordUsecase(this.repository);

  Future<UserCredential?> call(String email,String password)async{
    return await repository.signInWithEmailAndPassword(email, password);
  }
}