import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/usecases/user_usecase.dart';

part 'auth_firebase_event.dart';
part 'auth_firebase_state.dart';

class AuthFirebaseBloc extends Bloc<AuthFirebaseEvent, AuthFirebaseState> {
  final UserUsecase userUsecase;

  late final StreamSubscription<User?> _userSubscription;

  AuthFirebaseBloc({required this.userUsecase}) : super(AuthInitial()) {
    _userSubscription = userUsecase.call().listen((authUser) {
      add(AuthStateChanged(authUser));
    });

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

  @override
  Future<void> close() {
    print("dispose çalıştı");
    _userSubscription.cancel();
    return super.close();
  }
}
