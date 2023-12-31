import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/datasource/remote_datasource/firestore_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/repository/firestore_repository_impl.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_tags_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/index.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

Future<void> firestoreInjectionContainer() async {

  // Cubit or Bloc
  

  ///UseCases
  
  sl.registerLazySingleton<CreateProfileUsecase>(() =>CreateProfileUsecase(sl()));

  sl.registerLazySingleton<UpdateProfileUsecase>(() => UpdateProfileUsecase(sl()));

  sl.registerLazySingleton<GetProfileUsecase>(() => GetProfileUsecase(sl()));

  sl.registerLazySingleton<DeleteProfileUsecase>(() => DeleteProfileUsecase(sl()));

  sl.registerLazySingleton<CreateCommentProblemUsecase>(() => CreateCommentProblemUsecase(sl()));

  sl.registerLazySingleton<UpdateCommentProblemUsecase>(() => UpdateCommentProblemUsecase(sl()));

  sl.registerLazySingleton<GetCommentProblemUsecase>(() => GetCommentProblemUsecase(sl()));

  sl.registerLazySingleton<DeleteCommentProblemUsecase>(() => DeleteCommentProblemUsecase(sl()));

  sl.registerLazySingleton<GetCommentSuggestionUsecase>(() => GetCommentSuggestionUsecase(sl()));

  sl.registerLazySingleton<CreateCommentSuggestionUsecase>(() => CreateCommentSuggestionUsecase(sl()));

  sl.registerLazySingleton<UpdateCommentSuggestionUsecase>(() => UpdateCommentSuggestionUsecase(sl()));

  sl.registerLazySingleton<DeleteCommentSuggestionUsecase>(() => DeleteCommentSuggestionUsecase(sl()));

  sl.registerLazySingleton<CreateReportUsecase>(() => CreateReportUsecase(sl()));
 
  sl.registerLazySingleton<GetCommentProblemListAccordingToTagsUsecase>(() =>  GetCommentProblemListAccordingToTagsUsecase(sl()));

  
  /// Repository
  sl.registerLazySingleton<FirestoreRepository>(
          () => FirestoreRepositoryImpl(dataSource: sl()));

  /// Remote DataSource
  sl.registerLazySingleton<FirestoreRemoteDataSource>(
          () => FirestoreRemoteDataSourceImpl());

}