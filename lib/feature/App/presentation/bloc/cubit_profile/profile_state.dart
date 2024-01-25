part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final List<CommentProblemEntity?> comments;
  final bool isLoadingNewData;
  final bool isError;

  const ProfileLoaded(this.comments,
      {this.isLoadingNewData = false, this.isError = false});

  @override
  List<Object> get props => [comments, isLoadingNewData];
}
