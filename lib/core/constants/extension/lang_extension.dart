import 'package:flutter/material.dart';

/// The `LocaleToString` extension provides a mechanism for converting a [Locale] object to a string.
extension LocaleToString on Locale {
  String countryName() {
    switch (languageCode) {
      case 'tr':
        return 'turkish';
      case 'de':
        return 'germany';
      case 'en':
        return 'english';
      case 'fr':
        return 'french';
      case 'ar':
        return 'Arapça';
      default:
        return 'Unknown Country';
    }
  }
}