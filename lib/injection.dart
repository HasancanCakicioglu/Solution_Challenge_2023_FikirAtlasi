import 'package:get_it/get_it.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/core/logger/app_logger.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/app_injection_container.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/auth_injection_container.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Onboard/onboard_injection_container.dart';

final sl = GetIt.instance;

abstract final class LocatorGetIt {

  

  /// Responsible for registering all the dependencies
  static Future<void> setup() async {
    // Blocs
    sl
      ..registerFactory<AppLogger>(() => AppLogger())
      ..registerSingleton<AppRouter>(AppRouter());



    await authInjectionContainer();
    await onBoardInjectionContainer();
    await appInjectionContainer();
      


  }
}


