import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/cubit/splash_finished_cubit.dart';

/// A mixin providing animation control for a splash screen in a Flutter application.
mixin SplashScreenAnimationController<T extends StatefulWidget> on State<T> implements TickerProvider {
  /// Animation controller responsible for controlling the splash screen animation.
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    // Precache SVG images for improved performance during the splash screen display.
    SVGConstants.svgPrecacheImage();

    // Initialize the animation controller.
    controller = AnimationController(vsync: this);

    // Add a listener to handle animation status changes.
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // Notify the SplashFinishedControllerCubit when the animation completes.
        context.read<SplashFinishedControllerCubit>().splashFinishedAtLeastOnce();
        // Repeat the animation.
        controller.repeat();
      } else if (controller.status == AnimationStatus.dismissed) {
        // Forward the animation when it is dismissed.
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller to avoid memory leaks.
    controller.dispose();
    super.dispose();
  }
}
