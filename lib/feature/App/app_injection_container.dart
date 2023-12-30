


import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

Future<void> appInjectionContainer() async {

  // Cubit or Bloc
  sl.registerSingleton<BottomNavCubit>(BottomNavCubit());


}