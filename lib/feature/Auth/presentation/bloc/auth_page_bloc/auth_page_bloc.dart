import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_google_usecase.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

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

  void _onEmailChanged(
      AuthPageEmailChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      AuthPagePasswordChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onPasswordObscureChanged(
      AuthPagePasswordObscureChanged event, Emitter<AuthPageBlocState> emit) {
    emit(state.copyWith(passwordIsObscure: event.passwordIsObscure));
  }

  void _onSubmitted(AuthPageSubmitted event, Emitter<AuthPageBlocState> emit) {
    signInWithEmailAndPasswordUsecase.call(
      state.email,
      state.password,
    );
  }

  void signInWithGoogle() {
    signInWithGoogleUsecase.call();
  }
}
