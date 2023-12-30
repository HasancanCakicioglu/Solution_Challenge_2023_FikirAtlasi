import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



abstract class AuthRemoteDataSource {
  Future<void> signInWithGoogle();
  Stream<User?> get user;
  Future<String?> getCurrentUId();
  Future<UserCredential> signInWithAuthCredential(AuthCredential credential);
  Future<bool> isSignIn();
  Future<void> signOut();
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({
    FirebaseAuth? auth,
  }) : auth = auth ?? FirebaseAuth.instance;


  @override
	Stream<User?> get user {
		return auth.authStateChanges();
	}

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

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
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await signInWithAuthCredential(credential);
  }

  @override
  Future<UserCredential> signInWithAuthCredential(AuthCredential credential) async {
     return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
