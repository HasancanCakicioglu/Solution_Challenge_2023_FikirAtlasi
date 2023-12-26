import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<String?> getCurrentUId() async{

    return await dataSource.getCurrentUId();
  }

  @override
  Future<bool> isSignIn() {
    return dataSource.isSignIn();
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }
  
  @override
  Future<UserCredential> signInWithAuthCredential(AuthCredential credential) {
    
    return dataSource.signInWithAuthCredential(credential);
  }
  
  @override
  Future<void> signInWithGoogle() {
    return dataSource.signInWithGoogle();
  }
  
  @override
  Stream<User?> get user => dataSource.user;
}