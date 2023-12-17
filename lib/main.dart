import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_challenge_2023_recommender_app/app.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/lang/language.dart';
import 'package:solution_challenge_2023_recommender_app/core/logger/app_logger.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';




void main() async {

  await ApplicationInitialize().init();
  runApp(
    LanguageManager(child: const MyApp()),
  );
}


@immutable
/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> init() async {
  
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        LocatorGetIt.get<AppLogger>().e("RunZoneGuarded $error",stackTrace: stack);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    await Hive.initFlutter();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


    LocatorGetIt.setup();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    ) ;
    
    FlutterError.onError = (details) {
      /// crashlytics log insert here
      /// custom service or custom logger insert here
      /// Todo: add custom logger
      LocatorGetIt.get<AppLogger>().e("FlutterError.onError $details");
    };

  }


}
