import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/cubit/onboard_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/pages/mixin/onboard_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/widgets/page_content_list.dart';

/// [OnBoardingPageView] is the main widget for the onboarding pages.
class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView>
    with OnBoardPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.1,
            child: Column(
              children: [
                // Skip button at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: buildSkipButton(context),
                ),
                // Centered image above the text
                Expanded(
                  flex: 4,
                  child: Center(
                    child: PageView.builder(
                      itemCount: onBoardingContentsList.length,
                      controller: pageController,
                      onPageChanged: (int index) {
                        context
                            .read<OnBoardCubit>()
                            .onBoardIndexChangeState(index);
                      },
                      itemBuilder: (context, index) {
                        return buildPageContent(index);
                      },
                    ),
                  ),
                ),

                // Dots row and Next button at the bottom
                buildBottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the content of a single onboarding page.
  Widget buildPageContent(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image centered above the text
        Center(
          child: SvgPicture.asset(
            onBoardingContentsList[index].image,
            semanticsLabel: 'OnBoarding Page',
            height: MediaQuery.of(context).size.height * 0.45,
          ).paddedSymmetric(horizontal: Material3Design.largePagePadding),
        ),

        Text(
          onBoardingContentsList[index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ).paddedSymmetric(horizontal: Material3Design.mediumPagePadding),
        const SizedBox(height: Material3Design.mediumPagePadding),
        Text(
          onBoardingContentsList[index].description,
          textAlign: TextAlign.center,
        ).paddedSymmetric(horizontal: Material3Design.mediumPagePadding),
      ],
    ).padded(const EdgeInsets.only(top: 40));
  }

  /// Builds the bottom buttons section including dots and navigation buttons.
  Expanded buildBottomButtons(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Dots row
            buildDotsRow(context),
            // Next button
            buildNextButton(),
          ],
        ).paddedSymmetric(horizontal: Material3Design.largePadding).padded(
              const EdgeInsets.only(top: 60),
            ));
  }

  /// Builds the "Skip" button.
  CupertinoButton buildSkipButton(BuildContext context) {
    return CupertinoButton(
      child: Text("skip".tr()),
      onPressed: () {
        BlocProvider.of<OnBoardCubit>(context).onBoardFinishedChangeState(true);
      },
    );
  }

  /// Builds the row of dots indicating the current onboarding page.
  Row buildDotsRow(BuildContext context) {
    return Row(
      children: List.generate(
        onBoardingContentsList.length,
        (index) => BlocBuilder<OnBoardCubit, OnBoardState>(
          buildWhen: (previous, current) => previous.index != current.index,
          builder: (context, state) {
            return buildDot(index, state.index, context);
          },
        ),
      ),
    );
  }

  /// Builds a single dot in the dots row.
  AnimatedContainer buildDot(
      int index, int currentIndex, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: isDark
            ? (currentIndex == index ? Colors.white : Colors.white38)
            : (currentIndex == index ? Colors.black : Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  /// Builds the "Next" button with a progress indicator.
  CupertinoButton buildNextButton() {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: BlocBuilder<OnBoardCubit, OnBoardState>(
              buildWhen: (previous, current) =>
                  previous.percentage != current.percentage,
              builder: (context, state) {
                return CircularProgressIndicator(
                  value: state.percentage,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isDark ? Colors.white : Colors.black),
                  backgroundColor: isDark ? Colors.black : Colors.white,
                );
              },
            ),
          ),
          CircleAvatar(
            backgroundColor: isDark ? Colors.white : Colors.black,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: isDark ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () {
        if (context.read<OnBoardCubit>().state.index ==
            onBoardingContentsList.length - 1) {
          BlocProvider.of<OnBoardCubit>(context)
              .onBoardFinishedChangeState(true);
        }
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
