import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/repository/auth_repository_impl.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/is_sign_in.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_auth_credential.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_out.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/user_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_firebase_bloc/auth_firebase_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';


Future<void> authInjectionContainer() async {

  // Cubit or Bloc
  sl.registerFactory<AuthFirebaseBloc>(() => AuthFirebaseBloc(
      userUsecase: sl()));


  ///UseCases
  sl.registerLazySingleton<SignInWithGoogleUsecase>(() =>
      SignInWithGoogleUsecase(sl()));
  
  sl.registerLazySingleton<UserUsecase>(() =>
      UserUsecase(sl()));
  
  sl.registerLazySingleton<GetCurrentUIdUsecase>(() =>
      GetCurrentUIdUsecase(sl()));
  
  sl.registerLazySingleton<SignInWithAuthCredentialUsecase>(() =>
      SignInWithAuthCredentialUsecase(sl()));
  
  sl.registerLazySingleton<IsSignInUsecase>(() =>
      IsSignInUsecase(sl()));

  sl.registerLazySingleton<SignOutUsecase>(() =>
      SignOutUsecase(sl()));


  /// Repository
  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(dataSource: sl()));

  /// Remote DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl());

}