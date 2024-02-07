import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_google_usecase.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

/// BLoC responsible for handling authentication page events and state.
class AuthPageBloc extends Bloc<AuthPageBlocEvent, AuthPageBlocState> {
  final SignInWithEmailAndPasswordUsecase signInWithEmailAndPasswordUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;

  AuthPageBloc({
    required this.signInWithGoogleUsecase,
    required this.signInWithEmailAndPasswordUsecase,
  }) : super(const AuthPageBlocState()) {
    on<AuthPageBlocEvent>((event, emit) {});
    on<AuthPageEmailChanged>(_onEmailChanged);
    on<AuthPagePasswordChanged>(_onPasswordChanged);
    on<AuthPagePasswordObscureChanged>(_onPasswordObscureChanged);
    on<AuthPageSubmitted>(_onSubmitted);
  }

  /// Updates the state with the new email.
  void _onEmailChanged(
      AuthPageEmailChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(email: event.email));
  }

  /// Updates the state with the new password.
  void _onPasswordChanged(
      AuthPagePasswordChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(password: event.password));
  }

  /// Updates the state with the password obscuration status.
  void _onPasswordObscureChanged(
      AuthPagePasswordObscureChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(passwordIsObscure: event.passwordIsObscure));
  }

  /// Handles the authentication submission event.
  void _onSubmitted(AuthPageSubmitted event, Emitter<AuthPageBlocState> emit) {
    signInWithEmailAndPasswordUsecase.call(
      state.email,
      state.password,
    );
  }

  /// Triggers the sign-in process using Google.
  void signInWithGoogle() {
    signInWithGoogleUsecase.call();
  }
}
