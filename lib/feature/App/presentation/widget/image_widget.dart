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
          tag: 'FileImageWidget_${imageFile.path.hashCode}', // Unique tag for each image
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImage(
                    imageFile: imageFile,
                  ),
                ),
              );
            },
            child: Image.file(imageFile),
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final File imageFile;

  const FullScreenImage({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
          child: Hero(
            tag: 'FullScreenImage_${imageFile.path.hashCode}', // Unique tag for each image
            child: Image.file(imageFile),
          ),
        ),
      
    );
  }
}
