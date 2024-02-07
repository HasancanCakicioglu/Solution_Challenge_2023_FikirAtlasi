part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.comments = const [],
    this.text = "",
    this.isLoadingNewData = false,
    this.isError = false,
  });

  final List<CommentProblemEntity?> comments;
  final String text;
  final bool isLoadingNewData;
  final bool isError;
  

  SearchState copyWith({
    List<CommentProblemEntity?>? comments,
    String? text,
    bool? isLoadingNewData,
    bool? isError,
  }) {
    return SearchState(
      comments: comments ?? this.comments,
      text: text ?? this.text,
      isLoadingNewData: isLoadingNewData ?? this.isLoadingNewData,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [comments, text, isLoadingNewData, isError];
}

