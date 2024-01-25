import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_suggest_list_according_to_likecount_usecase.dart';

part 'leaderboard_suggest_state.dart';

class LeaderboardSuggestCubit extends Cubit<LeaderboardSuggestState> {
  LeaderboardSuggestCubit(
    this.getCommentSuggestListAccordingToLikeCountUseCase,
  ) : super(LeaderboardSuggestInitial());

  GetCommentSuggestionListAccordingToLikeCountUseCase getCommentSuggestListAccordingToLikeCountUseCase;

  final List<CommentSuggestionEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentSuggestListLastRefresh() async {
    emit(LeaderboardSuggestLoading());
    comments.clear();
    lastVisible = null;
    final failureOrCommentSuggestList =
        await getCommentSuggestListAccordingToLikeCountUseCase(lastVisible,gettingData: 4);
    failureOrCommentSuggestList.fold(
      (failure) => emit(LeaderboardSuggestLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentSuggestList) {
        comments.addAll(commentSuggestList.value1);
        emit(LeaderboardSuggestLoaded(comments, isLoadingNewData: false));
        lastVisible = commentSuggestList.value2;
      },
    );
  }

  Future<void> getCommentSuggestListLast() async {
    emit(LeaderboardSuggestLoaded(comments, isLoadingNewData: true));
    final failureOrCommentSuggestList =
        await getCommentSuggestListAccordingToLikeCountUseCase(lastVisible,gettingData: 4);
    failureOrCommentSuggestList.fold(
      (failure) => emit(LeaderboardSuggestLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentSuggestList) {
        comments.addAll(commentSuggestList.value1);
        emit(LeaderboardSuggestLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentSuggestList.value2;
      },
    );
  }
}
