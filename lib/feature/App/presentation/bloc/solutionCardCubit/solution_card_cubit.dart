import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/comment_solution_like_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/translate_text_usecase.dart';

part 'solution_card_state.dart';

class SolutionCardCubit extends Cubit<SolutionCardState> {
  CommentSolutionLikeUsecase commentProblemLikeUsecase;
  TranslateTextUsecase translateTextUsecase;
  SolutionCardCubit(
    this.commentProblemLikeUsecase,
    this.translateTextUsecase
  ) : super(const SolutionCardState());

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
    emit(state.copyWith(translationText: translateText));
  }
}
