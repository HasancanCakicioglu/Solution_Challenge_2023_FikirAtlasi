import 'package:get_it/get_it.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/core/logger/app_logger.dart';

abstract final class LocatorGetIt {
  /// [GetIt] instance
  static final _instance = GetIt.instance;

  static T get<T extends Object>() => _instance.get<T>();

  /// Responsible for registering all the dependencies
  static Future<void> setup() async {
    // Blocs
    _instance
      ..registerLazySingleton<AppLogger>(() => AppLogger())
      ..registerSingleton<AppRouter>(AppRouter());   


  }
}


