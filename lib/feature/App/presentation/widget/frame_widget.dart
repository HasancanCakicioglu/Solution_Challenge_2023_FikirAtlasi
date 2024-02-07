import 'package:flutter/material.dart';

/// A widget that displays a frame around its child widget.
///
/// The frame widget is typically used to provide a visual boundary or highlight
/// for a specific area of the user interface. It consists of a child widget
/// placed inside a stack, with an optional close button positioned at the top
/// right corner of the frame.
///
/// The frame can be customized by specifying the size of the frame and the
/// child widget. The close button can be triggered by tapping on it, and it
/// displays an icon of a cross with a white color.
class FrameWidget extends StatelessWidget {
  const FrameWidget({
    Key? key,
    this.onPressed,
    this.size = const Size(70, 70),
    required this.child,
  }) : super(key: key);

  /// A callback function that is triggered when the close button is tapped.
  final VoidCallback? onPressed;

  /// The size of the frame widget.
  final Size size;

  /// The child widget that is displayed inside the frame.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: child,
        ),
        deleteIconButton(),
      ],
    );
  }

  /// A close button that is positioned at the top right corner of the frame.
  Widget deleteIconButton() {
    return Positioned(
      top: 0,
      right: 0,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
