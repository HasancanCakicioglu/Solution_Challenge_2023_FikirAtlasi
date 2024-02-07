part of 'auth_page_bloc.dart';

/// Represents the events for user authentication.
sealed class AuthPageBlocEvent extends Equatable {
  const AuthPageBlocEvent();

  @override
  List<Object> get props => [];
}

/// Event for changing the email during authentication.
final class AuthPageEmailChanged extends AuthPageBlocEvent {
  final String email;

  const AuthPageEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

/// Event for changing the password during authentication.
final class AuthPagePasswordChanged extends AuthPageBlocEvent {
  final String password;

  const AuthPagePasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

/// Event for changing the obscuration status of the password during authentication.
final class AuthPagePasswordObscureChanged extends AuthPageBlocEvent {
  final bool passwordIsObscure;
  const AuthPagePasswordObscureChanged({required this.passwordIsObscure});

  @override
  List<Object> get props => [passwordIsObscure];
}

/// Event for submitting the authentication form.
final class AuthPageSubmitted extends AuthPageBlocEvent {
  const AuthPageSubmitted();
}
