part of 'auth_firebase_bloc.dart';

sealed class AuthFirebaseState extends Equatable {
  const AuthFirebaseState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthFirebaseState{}

final class AuthLoading extends AuthFirebaseState{}

final class AuthLoggedIn extends AuthFirebaseState {
  final User user;

  const AuthLoggedIn(this.user);
}

final class AuthLoggedOut extends AuthFirebaseState {}

class AuthError extends AuthFirebaseState {
  final String error;

  const AuthError(this.error);
}
