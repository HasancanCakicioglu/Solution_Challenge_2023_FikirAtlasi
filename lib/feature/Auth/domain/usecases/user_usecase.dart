import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class UserUsecase{
  final AuthRepository repository;

  UserUsecase(this.repository);

  Stream<User?> call(){
    return repository.user;
  }
}