import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_firebase_bloc/auth_firebase_bloc.dart';


@RoutePage()
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              BlocProvider.of<ThemeCubit>(context).changeTheme(brightness: Brightness.light);
            }, child: const Text("Light")),
            ElevatedButton(onPressed: (){
              BlocProvider.of<ThemeCubit>(context).changeTheme(brightness: Brightness.dark);
            }, child: const Text("Dark")),
            ElevatedButton(onPressed: (){
              signOutGoogle();
              
            }, child: const Text("GOOGLE SİGN OUT")),

            ElevatedButton(onPressed: (){
              
              AutoRouter.of(context).replaceNamed("/AuthState");
            }, child: const Text("GO TO AUTH STATE PAGE"))
          ],
        )
      ),
    );
  }
}


Future<void> signOutGoogle()async{


  
  FirebaseAuth.instance.signOut();

}