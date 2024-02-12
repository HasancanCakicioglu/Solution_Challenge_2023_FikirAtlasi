part of 'problem_card_cubit.dart';


final class ProblemCardState extends Equatable {
  const ProblemCardState({
    this.liked = true,
    this.translation,
    this.titleTranslation});
  
  final bool liked;
  final String? translation;
  final String? titleTranslation;

  copyWith({
    bool? liked,
    String? translation,
    String? titleTranslation,
  }) {
    return ProblemCardState(
      liked: liked ?? this.liked,
      translation: translation ?? this.translation,
      titleTranslation: titleTranslation ?? this.titleTranslation,
    );
  }

  @override
  List<Object?> get props => [liked,translation,titleTranslation];
}


