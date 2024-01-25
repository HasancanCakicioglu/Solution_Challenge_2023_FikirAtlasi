part of 'category_cubit.dart';


sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const CategoryLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData,isError];
}