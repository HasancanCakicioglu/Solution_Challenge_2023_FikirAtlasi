


import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

Future<void> appInjectionContainer() async {

  // Cubit or Bloc
  sl.registerSingleton<BottomNavCubit>(BottomNavCubit());

  sl.registerLazySingleton<HomeLastSentCubit>(() => HomeLastSentCubit(sl()));

  sl.registerLazySingleton<HomeSpecialForYouCubit>(() => HomeSpecialForYouCubit(sl()));


  


}