part of 'auth_register_bloc.dart';

/// Represents the events for user registration/authentication.
sealed class AuthRegisterEvent extends Equatable {
  const AuthRegisterEvent();

  @override
  List<Object> get props => [];
}

/// Event for changing the email during registration.
class AuthRegisterEmailChanged extends AuthRegisterEvent {
  const AuthRegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

/// Event for changing the first password during registration.
class AuthRegisterPasswordFirstChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordFirstChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

/// Event for changing the second password during registration.
class AuthRegisterPasswordSecondChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordSecondChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

/// Event for changing the obscuration status of the password during registration.
class AuthRegisterPasswordObscureChanged extends AuthRegisterEvent {
  const AuthRegisterPasswordObscureChanged(this.passwordIsObscure);

  final bool passwordIsObscure;

  @override
  List<Object> get props => [passwordIsObscure];
}

/// Event for submitting the registration form.
class AuthRegisterSubmitted extends AuthRegisterEvent {
  const AuthRegisterSubmitted();
}
