

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/problem_leaderboard.dart';

/// This mixin is used to handle the scroll events of the [ProblemLeaderBoardPageView] page.
mixin LeaderBoardProblemMixin<T extends StatefulWidget> on State<ProblemLeaderBoardPageView> {
  late CustomScrollController scrollControllerLeaderboardProblem;

  @override
  void initState() {
    super.initState();
    scrollControllerLeaderboardProblem = CustomScrollController();
    scrollControllerLeaderboardProblem.addListener(
      () {
        widget.scrollControllerNested.jumpTo(
            widget.scrollControllerNested.position.pixels +
                scrollControllerLeaderboardProblem.distanceOfScroll());

        if (scrollControllerLeaderboardProblem.isMaxExtent()) {
          //context.read<HomeLastSentCubit>().getCommentProblemListLast();
        }

        if (scrollControllerLeaderboardProblem.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (context
              .read<BottomNavCubit>()
              .state
              .bottomNavBarVisibleState
              .isVisible) {
            context.read<BottomNavCubit>().setIsVisible(false);
          }
        }
        if (scrollControllerLeaderboardProblem.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!context
              .read<BottomNavCubit>()
              .state
              .bottomNavBarVisibleState
              .isVisible) {
            context.read<BottomNavCubit>().setIsVisible(true);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    scrollControllerLeaderboardProblem.dispose();
    super.dispose();
  }
}