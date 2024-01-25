import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_likecount_usecase.dart';

part 'leaderboard_problem_state.dart';

class LeaderboardProblemCubit extends Cubit<LeaderboardProblemState> {
  LeaderboardProblemCubit(
    this.getCommentProblemListAccordingToLikeCountUseCase,
  ) : super(LeaderboardProblemInitial());

  GetCommentProblemListAccordingToLikeCountUseCase getCommentProblemListAccordingToLikeCountUseCase;

  final List<CommentProblemEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh() async {
    emit(LeaderboardProblemLoading());
    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToLikeCountUseCase(lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(LeaderboardProblemLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(LeaderboardProblemLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast() async {
    emit(LeaderboardProblemLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToLikeCountUseCase(lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(LeaderboardProblemLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(LeaderboardProblemLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }
}
