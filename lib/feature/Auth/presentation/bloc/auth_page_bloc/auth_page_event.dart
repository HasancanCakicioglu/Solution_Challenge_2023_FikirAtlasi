part of 'auth_page_bloc.dart';

sealed class AuthPageBlocEvent extends Equatable {
  const AuthPageBlocEvent();

  @override
  List<Object> get props => [];
}


final class AuthPageEmailChanged extends AuthPageBlocEvent {
  final String email;

  const AuthPageEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

final class AuthPagePasswordChanged extends AuthPageBlocEvent {
  final String password;

  const AuthPagePasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

final class AuthPagePasswordObscureChanged extends AuthPageBlocEvent {
  final bool passwordIsObscure;
  const AuthPagePasswordObscureChanged({required this.passwordIsObscure});

  @override
  List<Object> get props => [passwordIsObscure];
}

final class AuthPageSubmitted extends AuthPageBlocEvent {
  const AuthPageSubmitted();
}
