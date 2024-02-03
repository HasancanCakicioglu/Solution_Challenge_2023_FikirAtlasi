import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/pages/onboard_page.dart';

/// [OnBoardPageMixin] is a mixin that provides common functionality for managing
/// the state and page controller in an onboarding page.
mixin OnBoardPageMixin<T extends StatefulWidget> on State<OnBoardingPageView> {
  late PageController pageController;
  late bool isDark;


  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
    isDark =  context.isDarkMode;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
