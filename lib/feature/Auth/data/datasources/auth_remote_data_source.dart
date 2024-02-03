/// File: auth_remote_data_source.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// The `AuthRemoteDataSource` abstract class defines methods for handling
/// remote authentication operations.
abstract class AuthRemoteDataSource {
  /// Signs in the user with Google credentials.
  Future<void> signInWithGoogle();

  /// Signs in the user with email and password.
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password);

  /// Signs up the user with email and password.
  ///
  /// Takes an [email] and [password] as parameters and returns a [Future] that completes with a [UserCredential].
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password);

  /// Retrieves the stream of the authenticated user.
  Stream<User?> get user;

  /// Retrieves the current user's UID.
  Future<String?> getCurrentUId();

  /// Checks if the user is currently signed in.
  Future<bool> isSignIn();

  /// Signs out the currently authenticated user.
  Future<void> signOut();

  /// Signs in the user with the provided authentication credentials.
  Future<UserCredential> signInWithAuthCredential(AuthCredential credential);
}

/// The `AuthRemoteDataSourceImpl` class implements the `AuthRemoteDataSource`
/// interface, providing methods for remote authentication using Firebase Auth.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;

  /// Constructor for `AuthRemoteDataSourceImpl`.
  AuthRemoteDataSourceImpl({
    FirebaseAuth? auth,
  }) : auth = auth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return auth.authStateChanges();
  }

  @override
  Future<String?> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await signInWithAuthCredential(credential);
  }

  @override
  Future<UserCredential> signInWithAuthCredential(
      AuthCredential credential) async {
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  @override
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
