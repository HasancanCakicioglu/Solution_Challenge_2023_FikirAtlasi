import 'package:flutter/material.dart';

/// `SquareBox` is a custom widget representing a square-shaped box.
/// It consists of an `InkWell` widget with a `Container` that contains
/// an image. The box has a border with the specified color and a
/// circular border radius.
///
/// The `SquareBox` widget is designed to be clickable, and the `onTap` callback
/// is triggered when the box is tapped.
class SquareBox extends StatelessWidget {
  /// The file path of the image to be displayed in the box.
  final String imagePath;

  /// The color of the border surrounding the box.
  final Color color;

  /// The callback function to be executed when the box is tapped.
  final VoidCallback onTap;


  final Color? imageColor;

  /// Creates a new instance of `SquareBox`.
  ///
  /// The `imagePath`, `color`, and `onTap` parameters are required.
  const SquareBox({
    Key? key,
    required this.imagePath,
    required this.color,
    required this.onTap,
    this.imageColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          color: imageColor,
          imagePath,
          height: 32,
        ),
      ),
    );
  }
}
