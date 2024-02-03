/// File: auth_repository_impl.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

/// The `AuthRepositoryImpl` class implements the `AuthRepository` interface,
/// providing methods for handling authentication operations.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  /// Constructor for `AuthRepositoryImpl`.
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<String?> getCurrentUId() async {
    try {
      return await dataSource.getCurrentUId();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> isSignIn() async {
    try {
      return await dataSource.isSignIn();
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await dataSource.signOut();
    } catch (e) {
      return Future.value();
    }
  }

  @override
  Future<UserCredential> signInWithAuthCredential(
      AuthCredential credential) async {
    return await dataSource.signInWithAuthCredential(credential);
  }

  @override
  Future<void> signInWithGoogle() async{
    try {
      return await dataSource.signInWithGoogle();
    } catch (e) {
      return Future.value();
    }
  }

  @override
  Stream<User?> get user => dataSource.user;

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async{
    try {
      return await dataSource.signInWithEmailAndPassword(email, password);
    } catch (e) {
      return Future.value(null);
    }
  }

  @override
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await dataSource.signUpWithEmailAndPassword(email, password);
    } catch(e){
      return Future.value(null);
    }
  }
}
