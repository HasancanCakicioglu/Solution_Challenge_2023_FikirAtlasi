import 'package:flutter/material.dart';

/// The `CustomButtonWidget` is a reusable widget for creating custom elevated buttons.
/// It takes the `text` to be displayed on the button and an `onPressed` callback
/// function to be executed when the button is pressed.
class CustomButtonWidget extends StatelessWidget {
  /// The text to be displayed on the button.
  final String text;

  /// The callback function to be executed when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a new instance of `CustomButtonWidget`.
  ///
  /// The `text` and `onPressed` parameters are required.
  const CustomButtonWidget({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
