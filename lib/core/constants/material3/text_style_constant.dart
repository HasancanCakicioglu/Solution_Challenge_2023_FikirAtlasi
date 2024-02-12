// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/// The `AppTextStyle` class provides a centralized mechanism for managing App text styles.
class AppTextStyle {
  static const MINI_BOLD_DESCRIPTION_TEXT = TextStyle(
    fontSize: 13,
  
    letterSpacing: 3,
    fontWeight: FontWeight.w600,
  );
  static const MIDDLE_BUTTON_TEXT = TextStyle(
      fontSize: 20,
      letterSpacing: 5,
      
      fontWeight: FontWeight.w300);

  static const MINI_DESCRIPTION_TEXT =
      TextStyle(fontSize: 13, letterSpacing: 3);

  static const MINI_DEFAULT_DESCRIPTION_TEXT =
      TextStyle(fontSize: 13);

  static const MINI_DESCRIPTION_BOLD =
      TextStyle(fontSize: 13 ,fontWeight: FontWeight.w600);

  
  static const MIDDLE_DESCRIPTION_TEXT =
      TextStyle(fontSize: 16, letterSpacing: 1,fontWeight: FontWeight.w600);
}