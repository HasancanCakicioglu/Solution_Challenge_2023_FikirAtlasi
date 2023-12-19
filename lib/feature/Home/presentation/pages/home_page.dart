import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';


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
            }, child: const Text("Dark"))
          ],
        )
      ),
    );
  }
}