part of 'home_last_sent_cubit.dart';


sealed class HomeLastSentState extends Equatable {
  const HomeLastSentState();

  @override
  List<Object> get props => [];
}

final class HomeLastSentInitial extends HomeLastSentState {}

final class HomeLastSentLoading extends HomeLastSentState {}

final class HomeLastSentLoaded extends HomeLastSentState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const HomeLastSentLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}




