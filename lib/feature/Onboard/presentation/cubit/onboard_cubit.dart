import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "onboard_state.dart";

/// [OnBoardCubit] is a Cubit responsible for managing the state
/// of whether the onboarding process has been finished.
class OnBoardCubit extends Cubit<OnBoardState> {
  /// Initializes the cubit with the initial state of onboarding completion set to `false`.
  OnBoardCubit() : super(const OnBoardState());

  /// Changes the state to indicate whether the onboarding process has been finished.
  void onBoardFinishedChangeState(bool isFinished) {
    emit(state.copyWith(finished: isFinished));
  }

  /// Changes the state to update the current index and percentage of completion.
  void onBoardIndexChangeState(int currentIndex) {
    emit(state.copyWith(
        index: currentIndex, percentage: (currentIndex + 1) * 0.20));
  }
}
