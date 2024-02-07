part of 'app_theme_cubit.dart';

/// Theme State
final class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.system});

  /// Create a [ThemeState] from a map
  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(themeMode: ThemeMode.values[map['themeMode'] as int]);
  }

  /// The theme mode
  final ThemeMode themeMode;

  /// Convert the [ThemeState] to a map
  Map<String, dynamic> toMap() {
    return {'themeMode': themeMode.index};
  }

  @override
  List<Object> get props => [themeMode];
}
