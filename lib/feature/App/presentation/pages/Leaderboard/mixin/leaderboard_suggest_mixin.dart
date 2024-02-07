import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/suggest_leaderboard.dart';

/// This mixin is used to handle the scroll events of the [SuggestLeaderBoardPageView] page.
mixin LeaderBoardSuggestMixin<T extends StatefulWidget> on State<SuggestLeaderBoardPageView> {
  late CustomScrollController scrollControllerLeaderboardSuggest;

  @override
  void initState() {
    super.initState();
    scrollControllerLeaderboardSuggest = CustomScrollController();
    scrollControllerLeaderboardSuggest.addListener(
      () {
        widget.scrollControllerNested.jumpTo(
            widget.scrollControllerNested.position.pixels +
                scrollControllerLeaderboardSuggest.distanceOfScroll());

        if (scrollControllerLeaderboardSuggest.isMaxExtent()) {
          //context.read<HomeLastSentCubit>().getCommentSuggestListLast();
        }

        if (scrollControllerLeaderboardSuggest.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (context
              .read<BottomNavCubit>()
              .state
              .bottomNavBarVisibleState
              .isVisible) {
            context.read<BottomNavCubit>().setIsVisible(false);
          }
        }
        if (scrollControllerLeaderboardSuggest.position.userScrollDirection ==
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
    scrollControllerLeaderboardSuggest.dispose();
    super.dispose();
  }
}