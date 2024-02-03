part of 'auth_register_bloc.dart';

final class AuthRegisterState extends Equatable {
  const AuthRegisterState({
    this.email = "",
    this.passwordFirst = "",
    this.passwordSecond = "",
    this.passwordIsObscure = true,
  });
  final String email;
  final String passwordFirst;
  final String passwordSecond;
  final bool passwordIsObscure;

  AuthRegisterState copyWith({
    String? email,
    String? passwordFirst,
    String? passwordSecond,
    bool? passwordIsObscure,
  }) {
    return AuthRegisterState(
      email: email ?? this.email,
      passwordFirst: passwordFirst ?? this.passwordFirst,
      passwordSecond: passwordSecond ?? this.passwordSecond,
      passwordIsObscure: passwordIsObscure ?? this.passwordIsObscure,
    );
  }

  @override
  List<Object> get props => [email, passwordFirst,passwordSecond, passwordIsObscure];
}


