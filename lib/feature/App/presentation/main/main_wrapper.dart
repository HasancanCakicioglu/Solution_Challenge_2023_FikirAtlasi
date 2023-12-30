import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/widget/bottom_nav_bar.dart';


@RoutePage()
class MainWrapperView extends StatefulWidget {
  const MainWrapperView({super.key});

  @override
  State<MainWrapperView> createState() => _MainWrapperViewState();
}

class _MainWrapperViewState extends State<MainWrapperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavBarPages>(
          builder: (BuildContext context, BottomNavBarPages state) {
            return BlocProvider.of<BottomNavCubit>(context).pages[state.index];
          },
        ),
      
      bottomNavigationBar: const MainWrapperNavigationBar(),
    );
  }
}
