import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/lottie/lottie_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/presentation/mixin/splash_mixin.dart';

/// [SplashView] is the splash screen of the application, utilizing animation and a dark/light theme.
@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin, SplashScreenAnimationController {
  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark or light.
    final isDark = context.isDarkMode;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: _buildBody(controller, isDark),
    );
  }

  /// Builds the body of the splash screen.
  Widget _buildBody(AnimationController controller, bool isDark) {
    return Center(
      child: isDark
          ? ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.color),
              child: _buildLottieFile(controller),
            )
          : _buildLottieFile(controller),
    );
  }

  /// Builds the Lottie animation widget with delayed animation start.
  Widget _buildLottieFile(AnimationController controller) {
    return Lottie.asset(
      LottieConstants.splashScreen,
      controller: controller,
      onLoaded: (composition) {
        Future.delayed(const Duration(milliseconds: 500), () {
          controller
            ..duration = composition.duration
            ..forward();
        });
      },
    );
  }
}
