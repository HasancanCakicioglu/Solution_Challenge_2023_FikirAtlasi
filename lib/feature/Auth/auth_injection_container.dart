import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/data/repository/auth_repository_impl.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/is_sign_in.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_auth_credential.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_out.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_up_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/user_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_firebase_bloc/auth_firebase_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_page_bloc/auth_page_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_register_bloc/auth_register_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

  void authInjectionContainer() {
  // Cubit or Bloc
  sl.registerFactory<AuthFirebaseBloc>(() => AuthFirebaseBloc(
      signInWithGoogleUsecase: sl(),
      userUsecase: sl(),
      signInWithEmailAndPasswordUsecase: sl(),
      signUpWithEmailAndPasswordUsecase: sl()));

  sl.registerFactory<AuthPageBloc>(() => AuthPageBloc(
      signInWithEmailAndPasswordUsecase: sl(), signInWithGoogleUsecase: sl()));

  sl.registerFactory<AuthRegisterBloc>(
      () => AuthRegisterBloc(signUpWithEmailAndPasswordUsecase: sl()));

  ///UseCases
  sl.registerLazySingleton<SignInWithGoogleUsecase>(
      () => SignInWithGoogleUsecase(sl()));

  sl.registerLazySingleton<UserUsecase>(() => UserUsecase(sl()));

  sl.registerLazySingleton<GetCurrentUIdUsecase>(
      () => GetCurrentUIdUsecase(sl()));

  sl.registerLazySingleton<SignInWithAuthCredentialUsecase>(
      () => SignInWithAuthCredentialUsecase(sl()));

  sl.registerLazySingleton<IsSignInUsecase>(() => IsSignInUsecase(sl()));

  sl.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(sl()));

  sl.registerLazySingleton<SignUpWithEmailAndPasswordUsecase>(
      () => SignUpWithEmailAndPasswordUsecase(sl()));

  sl.registerLazySingleton<SignInWithEmailAndPasswordUsecase>(
      () => SignInWithEmailAndPasswordUsecase(sl()));

  /// Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: sl()));

  /// Remote DataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
}
