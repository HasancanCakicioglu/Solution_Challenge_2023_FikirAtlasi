


import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/data/datasources/local_datasource/services_local_datasource.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/data/repository/services_repository_impl.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/delete_model_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/download_model_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/get_searched_comments.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/is_model_downloaded_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/translate_text_usecase.dart';

import '../../injection.dart';

Future<void> servicesInjectionContainer() async {

  // Cubit or Bloc
  

  ///UseCases
  sl.registerLazySingleton<DeleteModelUsecase>(() =>DeleteModelUsecase(sl()));

  sl.registerLazySingleton<IsModelDownloadedUsecase>(() => IsModelDownloadedUsecase(sl()));

  sl.registerLazySingleton<TranslateTextUsecase>(() => TranslateTextUsecase(sl()));

  sl.registerLazySingleton<DownloadModelUsecase>(() => DownloadModelUsecase(sl()));

  sl.registerLazySingleton<GetSearchedCommentsUsecase>(() => GetSearchedCommentsUsecase(sl()));

    /// Repository
  sl.registerLazySingleton<ServicesRepository>(
          () => ServicesRepositoryImpl(localDataSource: sl()));

  /// Local DataSource
  sl.registerLazySingleton<ServicesLocalDataSource>(
          () => ServicesLocalDataSourceImpl(onDeviceTranslator: OnDeviceTranslator(sourceLanguage: TranslateLanguage.turkish, targetLanguage: TranslateLanguage.english),onDeviceTranslatorModelManager: OnDeviceTranslatorModelManager()));




  
  
  
  

}