




import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/problem_leaderboard.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/suggest_leaderboard.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                title: Text('Home'),
                centerTitle: true,
                floating: true,
                snap: true,
                pinned: false,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Problem'),
                    Tab(text: 'Suggest'),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [

              ProblemLeaderBoardPageView(),
              
              SuggestLeaderBoardPageView(),
              
            ],
          ),
        ),
      ),
    );
  }
}