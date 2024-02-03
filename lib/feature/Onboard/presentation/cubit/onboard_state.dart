part of 'onboard_cubit.dart';

/// Represents the state of the onboarding process.
/// 
/// The [OnBoardState] class contains information about the current progress of the onboarding process,
/// including the percentage of completion, the current index, and whether the onboarding is finished or not.
/// 
/// This class is immutable and can be copied with updated values using the [copyWith] method.
/// 
/// The [percentage] property represents the percentage of completion of the onboarding process.
/// The [index] property represents the current index of the onboarding process.
/// The [finished] property indicates whether the onboarding process is finished or not.
/// 
/// The [props] getter returns a list of properties that are used to determine equality between instances of [OnBoardState].
/// The [toString] method provides a string representation of the [OnBoardState] instance.
class OnBoardState extends Equatable {
  final double percentage;
  final int index;
  final bool finished;

  const OnBoardState({
    this.percentage = 0.25,
    this.index = 0,
    this.finished = false,
  });

  OnBoardState copyWith({
    double? percentage,
    int? index,
    bool? finished,
  }) {
    return OnBoardState(
      percentage: percentage ?? this.percentage,
      index: index ?? this.index,
      finished: finished ?? this.finished,
    );
  }

  @override
  List<Object> get props => [percentage, index, finished];

  @override
  String toString() {
    return 'OnBoardState(percentage: $percentage, index: $index, finished: $finished)';
  }
}
