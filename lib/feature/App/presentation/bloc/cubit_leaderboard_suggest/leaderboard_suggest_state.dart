part of 'leaderboard_suggest_cubit.dart';


sealed class LeaderboardSuggestState extends Equatable {
  const LeaderboardSuggestState();

  @override
  List<Object> get props => [];
}

final class LeaderboardSuggestInitial extends LeaderboardSuggestState {}

final class LeaderboardSuggestLoading extends LeaderboardSuggestState {}

final class LeaderboardSuggestLoaded extends LeaderboardSuggestState {
  final List<CommentSuggestionEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const LeaderboardSuggestLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}




