import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_leaderboard_problem/leaderboard_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_leaderboard_suggest/leaderboard_suggest_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/mixin/leaderboard_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/problem_leaderboard.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/suggest_leaderboard.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/sliver_appbar.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// This page is the leaderboard page of the application.
///
/// It contains two tabs, [ProblemLeaderBoardPageView] and [SuggestLeaderBoardPageView].
class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> with LeaderBoardMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          controller: scrollControllerNested,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBarWidget(
                text: "Leaderboard",
                tabbar: TabBar(
                  tabs: [
                    Tab(text: 'Problem'.tr()),
                    Tab(text: 'Suggest'.tr()),
                  ],
                ),
              )
            ];
          },
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl.get<LeaderboardProblemCubit>(),
              ),
              BlocProvider(
                create: (context) => sl.get<LeaderboardSuggestCubit>(),
              )
            ],
            child: Builder(
              builder: (context) {
                return TabBarView(
                  children: [
                    ProblemLeaderBoardPageView(
                      scrollControllerNested: scrollControllerNested,
                    ),
                    SuggestLeaderBoardPageView(
                        scrollControllerNested: scrollControllerNested),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
