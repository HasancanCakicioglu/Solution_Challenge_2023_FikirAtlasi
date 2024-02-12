// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_challenge_2023_recommender_app/app.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/lang/language.dart';
import 'package:solution_challenge_2023_recommender_app/core/logger/app_logger.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        sl<AppLogger>().e("RunZoneGuarded $error", stackTrace: stack);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {

    // Load environment variables from .env file
    await dotenv.load(fileName: ".env");

    // Setup dependency injection with GetIt
    LocatorGetIt.setup();

    // Ensure localization is initialized
    await EasyLocalization.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest,
    );

    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);

       
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    await FirebaseMessaging.instance.getNotificationSettings();
    // FirebaseMessaging.onBackgroundMessage((message) async {
    //   print("onBackgroundMessage: $message");
    // });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
    });
    FirebaseMessaging.onMessage.listen((message) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    });

    // Initialize Hive for Flutter
    await Hive.initFlutter();

    // Set preferred screen orientations
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Configure HydratedBloc storage
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );

    // Handle Flutter errors
    // FlutterError.onError = (details) {
    //   // Log the Flutter error using the AppLogger
    //   sl.get<AppLogger>().e("FlutterError.onError $details");

    // };
  }
}
