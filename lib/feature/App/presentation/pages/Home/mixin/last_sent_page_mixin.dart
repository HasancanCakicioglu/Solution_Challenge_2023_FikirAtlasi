import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/last_sent_page.dart';

/// Mixin for [LastSentPageView]
/// 
/// This mixin is used to handle the scroll events and the lifecycle of the [LastSentPageView]
mixin LastSentPageMixin<T extends StatefulWidget> on State<LastSentPageView> {
  late CustomScrollController scrollControllerLastSentPage;

  @override
  void initState() {
    super.initState();

    context.read<HomeLastSentCubit>().getCommentProblemListLastRefresh();

    scrollControllerLastSentPage = CustomScrollController();
    scrollControllerLastSentPage.addListener(
      () {
        widget.scrollControllerNested.jumpTo(
            widget.scrollControllerNested.position.pixels +
                scrollControllerLastSentPage.distanceOfScroll());

        if (scrollControllerLastSentPage.isMaxExtent()) {
          context.read<HomeLastSentCubit>().getCommentProblemListLast();
        }

        if (scrollControllerLastSentPage.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (context
              .read<BottomNavCubit>()
              .state
              .bottomNavBarVisibleState
              .isVisible) {
            context.read<BottomNavCubit>().setIsVisible(false);
          }
        }
        if (scrollControllerLastSentPage.position.userScrollDirection ==
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
    scrollControllerLastSentPage.dispose();
    super.dispose();
  }
}
