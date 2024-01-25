import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Search/search_page.dart';

mixin SearchPageMixin<T extends StatefulWidget> on State<SearchPage> {
  late ScrollController scrollControllerNested;

  @override
  void initState() {
    super.initState();
    scrollControllerNested = ScrollController();
    scrollControllerNested.addListener(() {
      if (scrollControllerNested.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (context
            .read<BottomNavCubit>()
            .state
            .bottomNavBarVisibleState
            .isVisible) {
          context.read<BottomNavCubit>().setIsVisible(false);
        }
      }
      if (scrollControllerNested.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!context
            .read<BottomNavCubit>()
            .state
            .bottomNavBarVisibleState
            .isVisible) {
          context.read<BottomNavCubit>().setIsVisible(true);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollControllerNested.dispose();
    super.dispose();
  }
}
