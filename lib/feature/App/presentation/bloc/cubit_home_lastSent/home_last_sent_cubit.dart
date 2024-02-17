import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_last_usecase.dart';

part 'home_last_sent_state.dart';

class HomeLastSentCubit extends Cubit<HomeLastSentState> {
  HomeLastSentCubit(
    this.getCommentProblemListLastUsecase,
  ) : super(HomeLastSentInitial());

  GetCommentProblemListLastUsecase getCommentProblemListLastUsecase;

  final List<CommentProblemEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh() async {
    emit(HomeLastSentLoading());
    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentProblemListLastUsecase(lastVisible,gettingData: 10);
    failureOrCommentProblemList.fold(
      (failure) => emit(HomeLastSentLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(HomeLastSentLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast() async {
    emit(HomeLastSentLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentProblemListLastUsecase(lastVisible,gettingData: 10);
    failureOrCommentProblemList.fold(
      (failure) => emit(HomeLastSentLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(HomeLastSentLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }
}
