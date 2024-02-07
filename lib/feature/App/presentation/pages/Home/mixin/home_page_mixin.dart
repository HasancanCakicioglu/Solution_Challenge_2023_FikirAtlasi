import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/home_page.dart';


/// Mixin for HomePageView
/// 
/// This mixin contains the scroll controller for the nested scroll view in the home page.
mixin HomePageMixin<T extends StatefulWidget> on State<HomePageView> {
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
