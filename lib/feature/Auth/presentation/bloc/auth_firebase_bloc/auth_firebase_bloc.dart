import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/sign_up_with_email_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/user_usecase.dart';

part 'auth_firebase_event.dart';
part 'auth_firebase_state.dart';

/// A BLoC responsible for handling user authentication.
class AuthFirebaseBloc extends Bloc<AuthFirebaseEvent, AuthFirebaseState> {
  final UserUsecase userUsecase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final SignInWithEmailAndPasswordUsecase signInWithEmailAndPasswordUsecase;
  final SignUpWithEmailAndPasswordUsecase signUpWithEmailAndPasswordUsecase;

  late final StreamSubscription<User?> _userSubscription;

  AuthFirebaseBloc(
      {required this.userUsecase,
      required this.signInWithGoogleUsecase,
      required this.signInWithEmailAndPasswordUsecase,
      required this.signUpWithEmailAndPasswordUsecase})
      : super(AuthInitial()) {
    _userSubscription = userUsecase.call().listen((authUser) {
      add(AuthStateChanged(authUser));
    });

    /// Handles the authentication state change event.
    on<AuthStateChanged>((event, emit) {
      emit(AuthLoading());

      try {
        if (event.user != null) {
          emit(AuthLoggedIn(event.user!));
        } else {
          emit(AuthLoggedOut());
        }
      } catch (e) {
        emit(const AuthError("An error occurred during authentication."));
      }
    });
  }

  /// Triggers the sign-in process using Google.
  void signInWithGoogle() async {
    await signInWithGoogleUsecase.call();
  }

  /// Handles the registration submission event.
  void signUpWithEmailAndPassword(String email, String password) async {
    await signUpWithEmailAndPasswordUsecase.call(email, password);
  }

  /// Handles the authentication submission event.
  void signInWithEmailAndPassword(String email, String password) async {
    await signInWithEmailAndPasswordUsecase.call(email, password);
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
