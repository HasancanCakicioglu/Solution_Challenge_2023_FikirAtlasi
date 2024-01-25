part of 'leaderboard_problem_cubit.dart';


sealed class LeaderboardProblemState extends Equatable {
  const LeaderboardProblemState();

  @override
  List<Object> get props => [];
}

final class LeaderboardProblemInitial extends LeaderboardProblemState {}

final class LeaderboardProblemLoading extends LeaderboardProblemState {}

final class LeaderboardProblemLoaded extends LeaderboardProblemState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const LeaderboardProblemLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}




