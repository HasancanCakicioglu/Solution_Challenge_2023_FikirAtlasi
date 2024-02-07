import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/leaderboard_page.dart';

/// This mixin is used to handle the scroll events of the [LeaderBoard] page.
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
