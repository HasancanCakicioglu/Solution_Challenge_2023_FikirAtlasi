import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/cubit/onboard_page_controller_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

Future<void> onBoardInjectionContainer() async {
  // Cubit or Bloc
  sl.registerFactory<OnBoardFinishedControllerCubit>(
      () => OnBoardFinishedControllerCubit());
}
