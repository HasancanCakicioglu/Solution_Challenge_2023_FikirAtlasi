import 'package:solution_challenge_2023_recommender_app/feature/Onboard/presentation/cubit/onboard_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// Function to set up dependency injection for the OnBoard feature
Future<void> onBoardInjectionContainer() async {
  // Cubit or Bloc
  sl.registerFactory<OnBoardCubit>(
      () => OnBoardCubit());
}
