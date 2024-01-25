import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_tags_usecase.dart';


part 'home_special_for_you_state.dart';


class HomeSpecialForYouCubit extends Cubit<HomeSpecialForYouState> {
  HomeSpecialForYouCubit(
    this.getCommentProblemListAccordingToTagsUsecase,
  ) : super(HomeSpecialForYouInitial());

  
  GetCommentProblemListAccordingToTagsUsecase getCommentProblemListAccordingToTagsUsecase;

  final List<CommentProblemEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh() async {
    emit(HomeSpecialForYouLoading());

    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToTagsUsecase(lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(HomeSpecialForYouLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(HomeSpecialForYouLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast() async {
    emit(HomeSpecialForYouLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToTagsUsecase(lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(HomeSpecialForYouLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(HomeSpecialForYouLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }
}
