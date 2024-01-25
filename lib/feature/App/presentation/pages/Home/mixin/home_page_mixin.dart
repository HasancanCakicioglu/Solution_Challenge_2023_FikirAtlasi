import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/home_page.dart';


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
