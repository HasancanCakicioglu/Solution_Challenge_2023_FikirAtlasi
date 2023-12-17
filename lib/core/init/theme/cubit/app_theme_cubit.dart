import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  /// Takes a [Brightness] object and changes the theme
  ///
  /// Give the brightness of the theme you want to change to.
  void changeTheme({required Brightness brightness}) {
    brightness == Brightness.dark
        ? emit(const ThemeState(themeMode: ThemeMode.dark))
        : emit(const ThemeState(themeMode: ThemeMode.light));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
