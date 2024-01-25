import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_searched_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/get_searched_comments.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.getCommentProblemListSearchedUsecase,
    this.getSearchedCommentsUsecase,
  ) : super(SearchInitial());

  GetCommentProblemListSearchedUsecase getCommentProblemListSearchedUsecase;
  GetSearchedCommentsUsecase getSearchedCommentsUsecase;

  final List<CommentProblemEntity?> comments = [];

  Future<void> getSearchCommentProblemListOnTap(String text) async {
    emit(SearchLoading());

    comments.clear();

    await getSearchedCommentsUsecase.call(text).then(
      (value) async {
        value.fold(
            (failure) => emit(
                SearchLoaded(comments, isLoadingNewData: false, isError: true)),
            (ids) async{
          await getCommentProblemListSearchedUsecase(ids).then((value) async {
            print("1");
            value.fold(
                (failure) => emit(SearchLoaded(comments,
                    isLoadingNewData: false,
                    isError: true)), (commentProblemList) {
              if (commentProblemList != null) {
                print("2");
                comments.addAll(commentProblemList);
              }
              print("3");
              print(comments);
              emit(SearchLoaded(comments, isLoadingNewData: false));
            });
          });
        });
        
      },
    );
  }
}
