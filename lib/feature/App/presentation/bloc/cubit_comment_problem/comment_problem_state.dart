part of 'comment_problem_cubit.dart';


sealed class CommentProblemState extends Equatable {
  const CommentProblemState();

  @override
  List<Object> get props => [];
}

final class CommentProblemInitial extends CommentProblemState {}

final class CommentProblemLoading extends CommentProblemState {}

final class CommentProblemLoaded extends CommentProblemState {
  final List<CommentSuggestionEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const CommentProblemLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}




