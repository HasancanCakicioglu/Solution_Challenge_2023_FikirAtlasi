import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
part 'bottom_nav_bar_destinations.dart';

class MainWrapperNavigationBar extends StatelessWidget {
  const MainWrapperNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavBarState>(
        builder: (BuildContext context, BottomNavBarState state) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: (state.bottomNavBarVisibleState.isVisible)
            ? kBottomNavigationBarHeight + 15
            : 0.0,
        child: Wrap(
          children: [
            NavigationBar(
                selectedIndex: BlocProvider.of<BottomNavCubit>(context)
                    .state
                    .bottomNavBarPages
                    .index,
                onDestinationSelected: (index) =>
                    BlocProvider.of<BottomNavCubit>(context)
                        .onDestinationSelected(index),
                destinations: _navigationBarDestinations)
          ],
        ),
      );
    });
  }
}
