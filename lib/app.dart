import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/dark/dark_schema.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/light/light_schema.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_firebase_bloc/auth_firebase_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Splash/cubit/splash_finished_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// The main application widget responsible for initializing and configuring the app.
class MyApp extends StatelessWidget {
  /// Creates a new instance of `MyApp`.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtain the AppRouter instance from the dependency injection container.
    final appRouter = sl<AppRouter>();

    return MultiBlocProvider(
      // Provide multiple BLoC instances to the widget tree.
      providers: [
        // ThemeCubit manages the theme state of the app.
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        // SplashFinishedControllerCubit manages the splash screen state.
        BlocProvider<SplashFinishedControllerCubit>(
          create: (_) => SplashFinishedControllerCubit(),
        ),
        // AuthFirebaseBloc manages the authentication state with Firebase.
        BlocProvider<AuthFirebaseBloc>(
          create: (_) => sl.get<AuthFirebaseBloc>(),
        ),
        // BottomNavCubit manages the state of the bottom navigation bar.
        BlocProvider<BottomNavCubit>(
          create: (_) => sl.get<BottomNavCubit>(),
        ),
        // ProfileEntityCubit manages the state of the user's profile.
        BlocProvider<ProfileEntityCubit>(
        create: (context) => sl.get<ProfileEntityCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        // Use BlocBuilder to dynamically set the theme based on the current state.
        builder: (context, themeState) {
          return MaterialApp.router(
            // Configure the MaterialApp with router and localization settings.
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'FikirAtlasi',
            theme: CustomLightTheme().themeData,
            darkTheme: CustomDarkTheme().themeData,
            themeMode: themeState.themeMode,
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
