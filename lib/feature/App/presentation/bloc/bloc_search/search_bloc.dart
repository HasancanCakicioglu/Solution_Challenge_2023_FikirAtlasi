import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_searched_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/get_searched_comments.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetCommentProblemListSearchedUsecase getCommentProblemListSearchedUsecase;
  GetSearchedCommentsUsecase getSearchedCommentsUsecase;
  SearchBloc(
    this.getCommentProblemListSearchedUsecase,
    this.getSearchedCommentsUsecase,
  ) : super(const SearchState()) {
    on<SearchEvent>((event, emit) {});
    on<SearchTextChanged>(_onSearchTextChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
  }

  void _onSearchTextChanged(
      SearchTextChanged event, Emitter<SearchState> emit) {
    emit(state.copyWith(text: event.text));
  }

  void _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchState> emit) async {
    emit(state.copyWith(isLoadingNewData: true, comments: [], isError: false));

    try {
      final value = await getSearchedCommentsUsecase.call(state.text);
      await value.fold(
        (failure) async{
          emit(state.copyWith(isLoadingNewData: false, isError: true));
        },
        (ids) async {
          final commentResult = await getCommentProblemListSearchedUsecase.call(ids);
           await commentResult.fold(
            (failure) async{
              emit(state.copyWith(isLoadingNewData: false, isError: true));
            },
            (commentProblemList)async{
              if (commentProblemList != null) {
                emit(state.copyWith(
                  comments: List.from(commentProblemList),
                  isLoadingNewData: false,
                  isError: false,
                ));
              } else {
                emit(state.copyWith(
                  isLoadingNewData: false,
                  isError: false,
                ));
              }
            },
          );
        },
      );
    } catch (e) {
      // Handle any errors
      emit(state.copyWith(isLoadingNewData: false, isError: true));
    }
  }
}
