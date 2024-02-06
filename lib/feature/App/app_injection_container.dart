


import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_post/post_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_category/category_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_comment_problem/comment_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_leaderboard_problem/leaderboard_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_leaderboard_suggest/leaderboard_suggest_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile/profile_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_search/search_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

Future<void> appInjectionContainer() async {

  // Cubit or Bloc
  sl.registerSingleton<BottomNavCubit>(BottomNavCubit());

  sl.registerLazySingleton<HomeLastSentCubit>(() => HomeLastSentCubit(sl()));

  sl.registerLazySingleton<HomeSpecialForYouCubit>(() => HomeSpecialForYouCubit(sl()));

  sl.registerLazySingleton<ProfileEntityCubit>(() => ProfileEntityCubit(sl(),sl()));

  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl()));

  sl.registerLazySingleton<SearchCubit>(() => SearchCubit(sl(),sl()));

  sl.registerLazySingleton<LeaderboardProblemCubit>(() => LeaderboardProblemCubit(sl()));

  sl.registerLazySingleton<LeaderboardSuggestCubit>(() => LeaderboardSuggestCubit(sl()));

  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl(),));

  sl.registerFactory<PostBloc>(() => PostBloc(sl(),sl(),sl(),sl()));

  sl.registerFactory<CommentProblemCubit>(() => CommentProblemCubit(sl()));

  







  


}