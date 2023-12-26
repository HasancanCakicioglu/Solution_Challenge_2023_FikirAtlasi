import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/cubit/splash_finished_cubit.dart';


mixin SplashScreenAnimationController<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    // Precache svg images when splash screen is shown
    SVGConstants.svgPrecacheImage();

    controller = AnimationController(vsync: this);
    
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        context.read<SplashFinishedControllerCubit>().splashFinishedAtLeastOnce();
        controller.repeat();
        
      }
      else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
      
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    
  }
}
