part of 'auth_firebase_bloc.dart';

/// Represents the events for user authentication.
sealed class AuthFirebaseEvent extends Equatable {
  const AuthFirebaseEvent();

  @override
  List<Object> get props => [];
}

/// Event for logging in the user.
class AuthStateChanged extends AuthFirebaseEvent {
  const AuthStateChanged(this.user);

  final User? user;
}
