import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/speacial_for_you_page.dart';

mixin SpeacialForYouPageMixin<T extends StatefulWidget> on State<SpeacialForYouPageView> {
  late CustomScrollController scrollControllerSpecialForYouPage;

  @override
  void initState() {
    super.initState();
    context.read<HomeSpecialForYouCubit>().getCommentProblemListLastRefresh();

    scrollControllerSpecialForYouPage = CustomScrollController();
    scrollControllerSpecialForYouPage.addListener(
      () {

        widget.scrollControllerNested.jumpTo(widget.scrollControllerNested.position.pixels+scrollControllerSpecialForYouPage.distanceOfScroll());

        if (scrollControllerSpecialForYouPage.isMaxExtent()) {
          context.read<HomeSpecialForYouCubit>().getCommentProblemListLast();
        }

        if (scrollControllerSpecialForYouPage.position.userScrollDirection ==
            ScrollDirection.reverse) {

          if (context.read<BottomNavCubit>().state.bottomNavBarVisibleState.isVisible) {
            context.read<BottomNavCubit>().setIsVisible(false);

          }
        }
        if (scrollControllerSpecialForYouPage.position.userScrollDirection ==
            ScrollDirection.forward) {

          if (!context.read<BottomNavCubit>().state.bottomNavBarVisibleState.isVisible) {
            context.read<BottomNavCubit>().setIsVisible(true);

          }
        }
      },
    );
  }

  @override
  void dispose() {
    scrollControllerSpecialForYouPage.dispose();
    super.dispose();
  }
}
