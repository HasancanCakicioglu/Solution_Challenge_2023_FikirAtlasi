import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/widget/custom_button.dart';


@RoutePage()
class WelcomePageView extends StatefulWidget {
  const WelcomePageView({super.key});

  @override
  State<WelcomePageView> createState() => _WelcomePageViewState();
}

class _WelcomePageViewState extends State<WelcomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Welcome Page"),
            SvgPicture.asset(SVGConstants.humanHello,
                semanticsLabel: 'Welcome Page'),

            const SizedBox(height: 20,),

            const Text("Merhaba, Hoşgeldiniz Fikir atlasına."),

            const SizedBox(height: 10,),

            CustomButtonWidget(text: "Hadi Başlayalım", onPressed: (){
              AutoRouter.of(context).replaceNamed(NavigationConstants.Auth);
            })
          ],
          
        ),
      ))),
    );
  }
}
