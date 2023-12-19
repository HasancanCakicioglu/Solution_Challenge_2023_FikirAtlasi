import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';

mixin SplashScreenAnimationController<T extends StatefulWidget> on State<T> implements TickerProvider{

   late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.addListener(() { 
      if(controller.status == AnimationStatus.completed){
        AutoRouter.of(context).replaceNamed(NavigationConstants.Home);
      }});
  }

  @override
  void dispose() {
    super.dispose();
     controller.dispose();
  }
}