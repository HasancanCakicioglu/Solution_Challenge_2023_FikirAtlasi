import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_firebase_bloc/auth_firebase_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/pages/auth_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/cubit/onboard_page_controller_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/pages/onboard_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/cubit/splash_finished_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/presentation/pages/splash_page.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class AuthStatePageView extends StatelessWidget {
  const AuthStatePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashFinishedControllerCubit, bool>(
      builder: (context, splashState) {
        return Scaffold(
          body: BlocBuilder<AuthFirebaseBloc, AuthFirebaseState>(
          builder: (context, authState) {
            // Auth connection state is connected and splash screen is finished
            // then go to home page
            if (authState is AuthLoggedIn && splashState) {
              AutoRouter.of(context).replaceNamed(NavigationConstants.mainWrapper);
            }
            // Auth connection state is not connected and splash screen is finished
            // then go to onboard page after auth page
            else if (authState is AuthLoggedOut && splashState) {
              return BlocProvider<OnBoardFinishedControllerCubit>(
                  create: (_) => sl.get<OnBoardFinishedControllerCubit>(),
                  child: BlocBuilder<OnBoardFinishedControllerCubit, bool>(
                    builder: (context, onBoardState) {
                      if (onBoardState) {
                        return const AuthPageView();
                      } else {
                        return const OnBoardingPageView();
                      }
                    },
                  ));
            } 
            // Auth connection has error and splash screen is finished
            else if (authState is AuthError && splashState) {
              return const Center(child: Text("Something Went Wrong!"));
            } 
            // Splash screen
            else {
              return const SplashView();
            }
            // Loading
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
      },
    );
  }
}

