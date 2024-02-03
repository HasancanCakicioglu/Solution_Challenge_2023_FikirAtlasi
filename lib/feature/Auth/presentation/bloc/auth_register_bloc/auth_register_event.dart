part of 'auth_register_bloc.dart';

sealed class AuthRegisterEvent extends Equatable {
  const AuthRegisterEvent();

  @override
  List<Object> get props => [];
}


class AuthRegisterEmailChanged extends AuthRegisterEvent {
  const AuthRegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class AuthRegisterPasswordFirstChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordFirstChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class AuthRegisterPasswordSecondChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordSecondChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class AuthRegisterPasswordObscureChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordObscureChanged(this.passwordIsObscure);

  final bool passwordIsObscure;

  @override
  List<Object> get props => [passwordIsObscure];
}

class AuthRegisterSubmitted extends AuthRegisterEvent {
  const AuthRegisterSubmitted();
}