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
  // Initialize the application
  await ApplicationInitialize().init();

  // Run the application with language management
  runApp(
    LanguageManager(child: const MyApp()),
  );
}

/// This class is used to initialize the application process
@immutable
final class ApplicationInitialize {
  /// Project basic required initialization
  Future<void> init() async {
    // Ensure Flutter is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Use runZonedGuarded to capture unhandled errors
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        // Log the error using the AppLogger
        LocatorGetIt.get<AppLogger>().e("RunZoneGuarded $error", stackTrace: stack);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    // Ensure localization is initialized
    await EasyLocalization.ensureInitialized();

    // Initialize Hive for Flutter
    await Hive.initFlutter();

    // Set preferred screen orientations
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Setup dependency injection with GetIt
    LocatorGetIt.setup();

    // Configure HydratedBloc storage
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );

    // Handle Flutter errors
    FlutterError.onError = (details) {
      // Log the Flutter error using the AppLogger
      LocatorGetIt.get<AppLogger>().e("FlutterError.onError $details");
    };
  }
}
