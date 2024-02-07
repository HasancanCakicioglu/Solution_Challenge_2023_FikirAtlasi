import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/comment_problem_like_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/translate_text_usecase.dart';

part 'problem_card_state.dart';

class ProblemCardCubit extends Cubit<ProblemCardState> {
  TranslateTextUsecase translateTextUsecase;
  CommentProblemLikeUsecase commentProblemLikeUsecase;
  ProblemCardCubit(
    this.commentProblemLikeUsecase,
    this.translateTextUsecase,
  ) : super(const ProblemCardState());

  void setLike(bool liked) => emit(state.copyWith(liked: liked));

  void likeComment(String commentID, bool isLike) async {
    final failureOrVoid = await commentProblemLikeUsecase.call(
      commentID,
      isLike,
    );
    failureOrVoid.fold(
      (failure) => emit(state.copyWith(liked: !isLike)),
      (r) => emit(state.copyWith(liked: isLike)),
    );
  }

  void translateText(String text) async {
    final translateText = await translateTextUsecase.call(text);
    emit(state.copyWith(translation: translateText));
  }
}
