import 'package:flutter/material.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget(
      {super.key,
      this.onPressed,
      this.size = const Size(70, 70),
      required this.child});
  final VoidCallback? onPressed;
  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: size.width, height: size.height, child: child),
        Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black
                    // Çarpı işareti rengi
                    ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white, // Çarpı işareti rengi
                ),
              ),
            )),
      ],
    );
  }
}
