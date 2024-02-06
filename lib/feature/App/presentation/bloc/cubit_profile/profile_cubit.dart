import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_profileID.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getCommentProblemListAccordingToProfileIDUsecas,
  ) : super(ProfileInitial());

  GetCommentProblemListAccordingToProfileIDUsecase
      getCommentProblemListAccordingToProfileIDUsecas;

  final List<CommentProblemEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh(String profileID) async {
    emit(ProfileLoading());
    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToProfileIDUsecas(
            profileID, lastVisible,
            gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) =>
          emit(ProfileLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(ProfileLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast(String profileID) async {
    emit(ProfileLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToProfileIDUsecas(
            profileID, lastVisible,
            gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) =>
          emit(ProfileLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(ProfileLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }
}
