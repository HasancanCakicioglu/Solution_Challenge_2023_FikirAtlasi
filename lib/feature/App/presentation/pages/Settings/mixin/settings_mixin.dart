import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/lang/language.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/theme/cubit/app_theme_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Settings/settings_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/index.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

mixin SettingsMixin<T extends StatefulWidget> on State<SettingsPageView> {
  late bool themeIsLight;
  late bool notificationIsOpen;
  late Locale localeLang;
  late bool phoneVerification;

  @override
  void initState() {
    super.initState();
    notificationIsOpen = false;
    phoneVerification = false;

    themeIsLight =
        BlocProvider.of<ThemeCubit>(context).state.themeMode == ThemeMode.light;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localeLang = context.locale;
  }

  void changeTheme() {
    setState(() {
      if (themeIsLight) {
        BlocProvider.of<ThemeCubit>(context)
            .changeTheme(brightness: Brightness.dark);
        themeIsLight = false;
      } else {
        BlocProvider.of<ThemeCubit>(context)
            .changeTheme(brightness: Brightness.light);
        themeIsLight = true;
      }
    });
  }

  void changeNotification(bool value) {
    setState(() {
      notificationIsOpen = value;
    });
    sl
        .get<UpdateProfileUsecase>()
        .call(ProfileEntity(isNotificationOpen: notificationIsOpen));
  }

  void updateLocale(Locale locale) {
    setState(() {
      LanguageManager.updateLanguage(context: context, value: locale);
      localeLang = locale;
    });
  }

  void takeActionBackFromSettingsOptionPage() async {
    await context.router
        .push<Locale?>(const SettingsLanguageOptionsPageRoute())
        .then((value) {
      if (value != null) {
        updateLocale(value);
      }
    });
  }

  void phoneVerificationFunc(bool value) {
    setState(() {
      phoneVerification = value;
    });
  }

  Future<void> signOutGoogle() async {
    FirebaseAuth.instance.signOut().then((value) {
      AutoRouter.of(context).replaceNamed(NavigationConstants.AuthState);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
