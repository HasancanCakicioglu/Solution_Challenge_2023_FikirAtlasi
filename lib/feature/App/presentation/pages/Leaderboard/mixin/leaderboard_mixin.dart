

import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/leaderboard_page.dart';

mixin LeaderBoardMixin<T extends StatefulWidget> on State<LeaderBoard> {
  late ScrollController scrollControllerNested;

  @override
  void initState() {
    super.initState();
    scrollControllerNested = ScrollController();
  }

  @override
  void dispose() {
    scrollControllerNested.dispose();
    super.dispose();
  }
}