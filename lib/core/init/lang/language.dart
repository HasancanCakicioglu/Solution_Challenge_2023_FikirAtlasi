import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../constants/enums/language.dart';


/// `LanguageManager` is responsible for managing language-related configurations.
final class LanguageManager extends EasyLocalization {

  /// Constructor to initialize `LanguageManager`.
  LanguageManager({
    required super.child,
    super.key,
  }) : super(
          saveLocale: true,
          supportedLocales: _supportedLocalesLanguages,
          path: _translationPath,
          useOnlyLangCode: true,
        );
  
  /// The path where translation files are stored.
  static const String _translationPath = 'assets/translations';

  /// A list of supported locales in the app.
  static List<Locale> get _supportedLocalesLanguages => [
        Locales.tr.locale,
        Locales.en.locale,
      ];

  /// Method to update the language.
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);


  /// Method to reset the language.
  static Future<void> setLocaleLanguage({
    required BuildContext context,
  }) =>
      context.resetLocale();
}
