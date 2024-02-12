part of 'solution_card_cubit.dart';


final class SolutionCardState extends Equatable {
  const SolutionCardState({
    this.liked = true,
    this.translationText,});
  
  final bool liked;
  final String? translationText;


  copyWith({
    bool? liked,
    String? translationText,
    String? titleTranslation,
  }) {
    return SolutionCardState(
      liked: liked ?? this.liked,
      translationText: translationText,
    );
  }

  @override
  List<Object?> get props => [liked,translationText];
}


