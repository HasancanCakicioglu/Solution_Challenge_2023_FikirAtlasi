import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_category_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(
    this.getCommentProblemListAccordingToCategoryUsecase
  ) : super(CategoryInitial());

  GetCommentProblemListAccordingToCategoryUsecase getCommentProblemListAccordingToCategoryUsecase;


  final List<CommentProblemEntity?> comments = [];
  QueryDocumentSnapshot<Object?>? lastVisible;

  Future<void> getCommentProblemListLastRefresh(CategoriesEnum categoriesEnum) async {
    emit(CategoryLoading());

    comments.clear();
    lastVisible = null;
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToCategoryUsecase(categoriesEnum,lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(CategoryLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(CategoryLoaded(comments, isLoadingNewData: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }

  Future<void> getCommentProblemListLast(CategoriesEnum categoriesEnum) async {
    emit(CategoryLoaded(comments, isLoadingNewData: true));
    final failureOrCommentProblemList =
        await getCommentProblemListAccordingToCategoryUsecase(categoriesEnum,lastVisible,gettingData: 4);
    failureOrCommentProblemList.fold(
      (failure) => emit(CategoryLoaded(comments, isLoadingNewData: false, isError: true)),
      (commentProblemList) {
        comments.addAll(commentProblemList.value1);
        emit(CategoryLoaded(comments, isLoadingNewData: false, isError: false));
        lastVisible = commentProblemList.value2;
      },
    );
  }
}
