part of 'auth_firebase_bloc.dart';

sealed class AuthFirebaseEvent extends Equatable {
  const AuthFirebaseEvent();

  @override
  List<Object> get props => [];
}

class AuthStateChanged extends AuthFirebaseEvent {
  const AuthStateChanged(this.user);

  final User? user;
}
