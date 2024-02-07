import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/datasource/remote_datasource/firestore_remote_data_source.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/data/repository/firestore_repository_impl.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/comment_problem_like_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/comment_solution_like_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_category_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_likecount_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_profileID.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_tags_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_last_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_searched_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_suggest_list_according_to_comment_id_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_suggest_list_according_to_likecount_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/index.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/select_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/upload_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

  void firestoreInjectionContainer()  {

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
  
  sl.registerLazySingleton<GetCommentProblemListAccordingToCategoryUsecase>(() => GetCommentProblemListAccordingToCategoryUsecase(sl()));

  sl.registerLazySingleton<GetCommentProblemListAccordingToLikeCountUseCase>(() => GetCommentProblemListAccordingToLikeCountUseCase(sl()));
  
  sl.registerLazySingleton<GetCommentSuggestionListAccordingToLikeCountUseCase>(() => GetCommentSuggestionListAccordingToLikeCountUseCase(sl()));

  sl.registerLazySingleton<GetCommentProblemListLastUsecase>(() => GetCommentProblemListLastUsecase(sl()));

  sl.registerLazySingleton<SelectFilesUsecase>(() => SelectFilesUsecase(sl()));

  sl.registerLazySingleton<UploadFilesUsecase>(() => UploadFilesUsecase(sl()));

  sl.registerLazySingleton<GetCommentProblemListSearchedUsecase>(() => GetCommentProblemListSearchedUsecase(sl()));
  
  sl.registerLazySingleton<GetCommentProblemListAccordingToProfileIDUsecase>(() => GetCommentProblemListAccordingToProfileIDUsecase(sl()));

  sl.registerLazySingleton<GetCommentSuggestListAccordingToCommentIDUsecase>(() => GetCommentSuggestListAccordingToCommentIDUsecase(sl()));

  sl.registerLazySingleton<CommentProblemLikeUsecase>(() => CommentProblemLikeUsecase(sl()));

  sl.registerLazySingleton<CommentSolutionLikeUsecase>(() => CommentSolutionLikeUsecase(sl()));

  /// Repository
  sl.registerLazySingleton<FirestoreRepository>(
          () => FirestoreRepositoryImpl(dataSource: sl()));

  /// Remote DataSource
  sl.registerLazySingleton<FirestoreRemoteDataSource>(
          () => FirestoreRemoteDataSourceImpl());

}