part of 'auth_page_bloc.dart';

/// Represents the state for user authentication.
class AuthPageBlocState extends Equatable {
  const AuthPageBlocState({
    this.email = "",
    this.password = "",
    this.passwordIsObscure = true,
  });
  final String email;
  final String password;
  final bool passwordIsObscure;

  AuthPageBlocState copyWith({
    String? email,
    String? password,
    bool? passwordIsObscure,
  }) {
    return AuthPageBlocState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordIsObscure: passwordIsObscure ?? this.passwordIsObscure,
    );
  }

  @override
  List<Object> get props => [email, password, passwordIsObscure];
}
