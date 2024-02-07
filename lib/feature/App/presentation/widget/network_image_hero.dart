import 'package:flutter/material.dart';

/// NetworkImageHero widget is used to display an image from a network source
class NetworkImageHero extends StatelessWidget {
  const NetworkImageHero({super.key, required this.image,required this.tag});
  final String image;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Hero(
        tag: image,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
            loadingBuilder: (context, widget, imageChunk) {
              return imageChunk == null
                  ? widget
                  : const CircularProgressIndicator();
            },
          ),
        ),
      ),)
    );
  }
}
