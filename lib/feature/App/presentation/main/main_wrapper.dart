import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/widget/bottom_nav_bar.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

/// Represents the main wrapper view.
/// 
/// This view is the main view of the application. It contains the bottom navigation bar and the main content of the application.
@RoutePage()
class MainWrapperView extends StatefulWidget {
  const MainWrapperView({super.key});

  @override
  State<MainWrapperView> createState() => _MainWrapperViewState();
}

class _MainWrapperViewState extends State<MainWrapperView> {
  @override
  void initState() {
    super.initState();
    createProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavBarState>(
        builder: (BuildContext context, BottomNavBarState state) {
          return LazyLoadIndexedStack(
              index: state.bottomNavBarPages.index,
              children: BlocProvider.of<BottomNavCubit>(context).pages);
        },
      ),
      bottomNavigationBar: const MainWrapperNavigationBar(),
    );
  }

  /// Creates the profile of the user on Firebase.
  void createProfile(BuildContext context) async {
    return await context.read<ProfileEntityCubit>().getOrSetProfile();
  }
}
