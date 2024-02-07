import 'dart:io';
import 'package:flutter/material.dart';

/// A widget that displays an image from a file.
/// 
/// This widget displays an image from a file and allows the user to tap on it to
class FileImageWidget extends StatelessWidget {
  final File imageFile;
  final Size size;

  const FileImageWidget({Key? key, required this.imageFile, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Hero(
          tag: "${imageFile.hashCode}", // Unique tag for each image
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImage(
                      imageFile: imageFile,
                      size: size,
                    ),
                  ),
                );
              },
              child: Image.file(imageFile,
                  fit: BoxFit.fill,
                  height: size.height,
                  width: size.width,
                  cacheHeight: MediaQuery.of(context).size.height.toInt(),
                  cacheWidth: MediaQuery.of(context).size.width.toInt())),
        ),
      ),
    );
  }
}

/// A full screen image that is displayed when the user taps on an image.
/// 
/// This widget displays the image in full screen mode when the user taps on it.
class FullScreenImage extends StatelessWidget {
  final File imageFile;
  final Size size;

  const FullScreenImage({Key? key, required this.imageFile, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: Hero(
        tag: "${imageFile.hashCode}",
        child: Image.file(
          imageFile,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          cacheHeight: MediaQuery.of(context).size.height.toInt(),
          cacheWidth: MediaQuery.of(context).size.width.toInt(),
        ),
      )),
    ));
  }
}
