import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
part 'bottom_nav_bar_destinations.dart';

class MainWrapperNavigationBar extends StatelessWidget {
  const MainWrapperNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<BottomNavCubit, BottomNavBarPages>(
        builder: (BuildContext context, BottomNavBarPages state) {
      return NavigationBar(
          selectedIndex: BlocProvider.of<BottomNavCubit>(context).state.index,
          onDestinationSelected: (index) =>
              BlocProvider.of<BottomNavCubit>(context)
                  .onDestinationSelected(index),
          destinations: _navigationBarDestinations);
    });
  }
}