part of 'auth_firebase_bloc.dart';

/// Represents the states for user authentication.
sealed class AuthFirebaseState extends Equatable {
  const AuthFirebaseState();

  @override
  List<Object> get props => [];
}

/// Initial state for user authentication.
final class AuthInitial extends AuthFirebaseState{}

/// Loading state for user authentication.
final class AuthLoading extends AuthFirebaseState{}

/// State for when the user is logged in.
final class AuthLoggedIn extends AuthFirebaseState {
  final User user;

  const AuthLoggedIn(this.user);
}

/// State for when the user is logged out.
final class AuthLoggedOut extends AuthFirebaseState {}

/// State for when there is an error during authentication.
class AuthError extends AuthFirebaseState {
  final String error;

  const AuthError(this.error);
}
