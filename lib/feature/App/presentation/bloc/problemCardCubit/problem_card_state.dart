part of 'problem_card_cubit.dart';


final class ProblemCardState extends Equatable {
  const ProblemCardState({
    this.liked = true,
    this.translation,});
  
  final bool liked;
  final String? translation;

  copyWith({
    bool? liked,
    String? translation,
  }) {
    return ProblemCardState(
      liked: liked ?? this.liked,
      translation: translation ?? this.translation,
    );
  }

  @override
  List<Object?> get props => [liked,translation];
}


