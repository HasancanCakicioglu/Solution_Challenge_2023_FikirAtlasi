import 'package:firebase_auth/firebase_auth.dart';

/// `AuthRepository` defines the contract for authentication operations in the application.
///
/// This abstract class provides a set of methods to interact with the authentication system,
/// including signing in with Google, retrieving user information, managing authentication state,
/// and signing out.
abstract class AuthRepository {
  /// Initiates the authentication process using Google Sign-In.
  ///
  /// Returns a [Future] that completes when the Google Sign-In process is complete.
  Future<void> signInWithGoogle();

  /// Signs in the user with email and password.
  /// 
  /// Takes an [email] and [password] as parameters and returns a [Future] that completes with a [UserCredential].
  Future<UserCredential?> signInWithEmailAndPassword(String email,String password);

  /// Signs up the user with email and password.
  ///   
  /// Takes an [email] and [password] as parameters and returns a [Future] that completes with a [UserCredential].
  Future<UserCredential?> signUpWithEmailAndPassword(String email,String password);

  /// Provides a [Stream] to listen for changes in the authenticated user.
  ///
  /// The stream emits the current authenticated user and updates when the authentication state changes.
  Stream<User?> get user;

  /// Retrieves the UID (User ID) of the currently authenticated user.
  ///
  /// Returns a [Future] containing the UID as a [String], or `null` if no user is authenticated.
  Future<String?> getCurrentUId();

  /// Signs in with the provided authentication credential.
  ///
  /// Takes an [AuthCredential] as a parameter and returns a [Future] that completes with a [UserCredential].
  Future<UserCredential> signInWithAuthCredential(AuthCredential credential);

  /// Checks if a user is currently signed in.
  ///
  /// Returns a [Future] that completes with a boolean value indicating the sign-in status.
  Future<bool> isSignIn();

  /// Signs out the currently authenticated user.
  ///
  /// Returns a [Future] that completes when the sign-out process is complete.
  Future<void> signOut();
}
