import 'dart:io';
import 'package:flutter/material.dart';


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
