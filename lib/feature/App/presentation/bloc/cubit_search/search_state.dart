part of 'search_cubit.dart';


sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const SearchLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData,isError];
}