import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_up_with_email_usecase.dart';

part 'auth_register_event.dart';
part 'auth_register_state.dart';

class AuthRegisterBloc extends Bloc<AuthRegisterEvent, AuthRegisterState> {
  final SignUpWithEmailAndPasswordUsecase signUpWithEmailAndPasswordUsecase;
  AuthRegisterBloc({required this.signUpWithEmailAndPasswordUsecase}) : super(const AuthRegisterState()) {
    on<AuthRegisterEvent>((event, emit) {});
    on<AuthRegisterEmailChanged>(_onEmailChanged);
    on<AuthRegisterPasswordFirstChanged>(_onPasswordChanged);
    on<AuthRegisterPasswordSecondChanged>(_onPasswordSecondChanged);
    on<AuthRegisterPasswordObscureChanged>(_onPasswordObscureChanged);
    on<AuthRegisterSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
      AuthRegisterEmailChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      AuthRegisterPasswordFirstChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordFirst: event.password));
  }

  void _onPasswordSecondChanged(
      AuthRegisterPasswordSecondChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordSecond: event.password));
  }

  void _onPasswordObscureChanged(
      AuthRegisterPasswordObscureChanged event, Emitter<AuthRegisterState> emit) {
    emit(state.copyWith(passwordIsObscure: event.passwordIsObscure));
  }

  void _onSubmitted(AuthRegisterSubmitted event, Emitter<AuthRegisterState> emit) async{
    if(state.passwordFirst == state.passwordSecond){
      await signUpWithEmailAndPasswordUsecase.call(state.email, state.passwordFirst);
    }
  }

}
