import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {

  Future<void> signInWithGoogle();
  Stream<User?> get user;

  Future<String?> getCurrentUId();

  Future<UserCredential> signInWithAuthCredential(AuthCredential credential);
  
  Future<bool> isSignIn();
  Future<void> signOut();
}
