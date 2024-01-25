import 'package:flutter/material.dart';

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