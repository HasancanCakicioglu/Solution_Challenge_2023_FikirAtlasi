part of 'solution_card_cubit.dart';


final class SolutionCardState extends Equatable {
  const SolutionCardState({
    this.liked = true,});
  
  final bool liked;

  copyWith({
    bool? liked,
  }) {
    return SolutionCardState(
      liked: liked ?? this.liked,
    );
  }

  @override
  List<Object> get props => [liked];
}


