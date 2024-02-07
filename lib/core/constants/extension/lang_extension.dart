import 'package:flutter/material.dart';

/// The `LocaleToString` extension provides a mechanism for converting a [Locale] object to a string.
extension LocaleToString on Locale {
  String countryName() {
    switch (languageCode) {
      case 'tr':
        return 'Türkçe';
      case 'de':
        return 'Almanca';
      case 'en':
        return 'İngilizce';
      case 'fr':
        return 'Fransızca';
      case 'ar':
        return 'Arapça';
      default:
        return 'Unknown Country';
    }
  }
}