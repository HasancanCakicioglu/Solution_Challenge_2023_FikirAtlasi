part of 'home_special_for_you_cubit.dart';


sealed class HomeSpecialForYouState extends Equatable {
  const HomeSpecialForYouState();

  @override
  List<Object> get props => [];
}

final class HomeSpecialForYouInitial extends HomeSpecialForYouState {}

final class HomeSpecialForYouLoading extends HomeSpecialForYouState {}

final class HomeSpecialForYouLoaded extends HomeSpecialForYouState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const HomeSpecialForYouLoaded(this.comments, {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}




