import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/cubit/onboard_page_controller_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/widgets/page_content_list.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  PageController? pageController;
  int currentIndex = 0;
  double percentage = 0.25;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: PageView.builder(
                  itemCount: onBoardingContentsList.length,
                  controller: pageController,
                  onPageChanged: (int index) {
                    if (index >= currentIndex) {
                      setState(() {
                        currentIndex = index;
                        percentage += 0.25;
                      });
                    } else {
                      setState(() {
                        currentIndex = index;
                        percentage -= 0.25;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(onBoardingContentsList[index].title),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(onBoardingContentsList[index].description),
                            ],
                          ),
                        ),
                        SvgPicture.asset(onBoardingContentsList[index].image,
                            semanticsLabel: 'OnBoarding Page')
                      ],
                    );
                  })),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                        children: List.generate(onBoardingContentsList.length,
                            (index) => buildDot(index, context))),
                    const SizedBox(height: 10),
                    CupertinoButton(child: const Text("Skip"), onPressed: () {
                      BlocProvider.of<OnBoardFinishedControllerCubit>(context).onBoardFinished();
                    })
                  ],
                ),
                CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            value: percentage,
                            strokeWidth: 2,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(Colors.white),
                            backgroundColor: Colors.white38,
                          ),
                        ),
                        const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                            )),
                      ],
                    ),
                    onPressed: () {
                      if (currentIndex == onBoardingContentsList.length - 1) {
                        BlocProvider.of<OnBoardFinishedControllerCubit>(context).onBoardFinished();
                      }
                      pageController!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    })
              ],
            ),
          )),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.white : Colors.white38,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
