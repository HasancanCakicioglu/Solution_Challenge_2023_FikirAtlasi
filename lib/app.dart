
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/dark/dark_schema.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/light/light_schema.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = LocatorGetIt.get<AppRouter>(); 

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child:
          BlocBuilder<ThemeCubit, ThemeState>(builder: (context, themeState) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Flutter Demo',
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          themeMode: themeState.themeMode,
          routerConfig: appRouter.config(),
        );
      }),
    );
  }
}


