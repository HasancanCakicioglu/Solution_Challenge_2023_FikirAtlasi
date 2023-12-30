import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';

@RoutePage()
class AuthPageView extends StatefulWidget {
  const AuthPageView({super.key});

  @override
  State<AuthPageView> createState() => _AuthPageViewState();
}

class _AuthPageViewState extends State<AuthPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Page"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
            ElevatedButton(onPressed: (){
              denemeGOOGLE();
            }, child: const Text("Google sign in")),
            ElevatedButton(onPressed: (){
            signOutGoogle();
            }, child: const Text("Google sign out")),
            ElevatedButton(onPressed: (){
              AutoRouter.of(context).replaceNamed(NavigationConstants.Home);
            }, child: const Text("Go to Home"))
          ],
        ),
      ),
    );
  }
}


Future<void> signOutGoogle()async{


  await GoogleSignIn().signOut();

}

Future<void> denemeGOOGLE()async{
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  final User? user = userCredential.user;
  print(user);
  
  }