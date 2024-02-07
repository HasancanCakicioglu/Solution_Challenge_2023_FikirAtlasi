part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTextChanged extends SearchEvent {
  final String text;

  const SearchTextChanged({required this.text});

  @override
  List<Object> get props => [text];
}

class SearchSubmitted extends SearchEvent {
  const SearchSubmitted();

  @override
  List<Object> get props => [];
}
