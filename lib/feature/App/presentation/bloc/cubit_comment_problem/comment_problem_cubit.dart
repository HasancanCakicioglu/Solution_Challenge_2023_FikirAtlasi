import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_suggest_list_according_to_comment_id_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/profile_last_looked_contents_usecase.dart';

part 'comment_problem_state.dart';

class CommentProblemCubit extends Cubit<CommentProblemState> {
  
  CommentProblemCubit(
    this.getCommentSuggestListAccordingToCommentIDUsecase,
    this.profileLastLookedContentsUsecase
  ) : super(CommentProblemInitial());

  GetCommentSuggestListAccordingToCommentIDUsecase getCommentSuggestListAccordingToCommentIDUsecase;
  ProfileLastLookedContentsUsecase profileLastLookedContentsUsecase;

  final List<CommentSuggestionEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh(String commentID) async {
    emit(CommentProblemLoading());
    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentSuggestListAccordingToCommentIDUsecase(commentID,lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure){
        emit(CommentProblemLoaded(comments, isLoadingNewData: false, isError: true));
      },
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(CommentProblemLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast(String commendID) async {
    emit(CommentProblemLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentSuggestListAccordingToCommentIDUsecase(commendID,lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(CommentProblemLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(CommentProblemLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  void profileLastLookedContents(CommentProblemEntity commentProblemEntity) async {
    await profileLastLookedContentsUsecase.call(commentProblemEntity);
  }
}
