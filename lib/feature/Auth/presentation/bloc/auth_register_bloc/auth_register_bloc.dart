import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_up_with_email_usecase.dart';

part 'auth_register_event.dart';
part 'auth_register_state.dart';

/// A BLoC responsible for handling user registration/authentication.
class AuthRegisterBloc extends Bloc<AuthRegisterEvent, AuthRegisterState> {
  final SignUpWithEmailAndPasswordUsecase signUpWithEmailAndPasswordUsecase;

  /// Initializes the AuthRegisterBloc with the SignUpWithEmailAndPasswordUsecase.
  AuthRegisterBloc({required this.signUpWithEmailAndPasswordUsecase})
      : super(const AuthRegisterState()) {
    on<AuthRegisterEmailChanged>(_onEmailChanged);
    on<AuthRegisterPasswordFirstChanged>(_onPasswordChanged);
    on<AuthRegisterPasswordSecondChanged>(_onPasswordSecondChanged);
    on<AuthRegisterPasswordObscureChanged>(_onPasswordObscureChanged);
    on<AuthRegisterSubmitted>(_onSubmitted);
  }

  /// Updates the state with the new email.
  void _onEmailChanged(
      AuthRegisterEmailChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  /// Updates the state with the new first password.
  void _onPasswordChanged(
      AuthRegisterPasswordFirstChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordFirst: event.password));
  }

  /// Updates the state with the new second password.
  void _onPasswordSecondChanged(
      AuthRegisterPasswordSecondChanged event,
      Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordSecond: event.password));
  }

  /// Updates the state with the password obscuration status.
  void _onPasswordObscureChanged(
      AuthRegisterPasswordObscureChanged event,
      Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordIsObscure: event.passwordIsObscure));
  }

  /// Handles the registration submission event.
  void _onSubmitted(AuthRegisterSubmitted event, Emitter<AuthRegisterState> emit) async {
    if (state.passwordFirst == state.passwordSecond) {
      await signUpWithEmailAndPasswordUsecase.call(state.email, state.passwordFirst);
    }
  }
}
