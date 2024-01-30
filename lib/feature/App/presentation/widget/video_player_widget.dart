import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FileVideoPlayerWidget extends StatefulWidget {
  final File videoFile;
  final Size size;

  const FileVideoPlayerWidget({Key? key, required this.videoFile,required this.size})
      : super(key: key);

  @override
  State<FileVideoPlayerWidget> createState() => _FileVideoPlayerWidgetState();
}

class _FileVideoPlayerWidgetState extends State<FileVideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: GestureDetector(
          onTap: () {
            _onVideoTap(context);
          },
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      
    );
  }

  void _onVideoTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayer(videoController: _controller),
      ),
    ).then((value){
      if(_controller.value.isPlaying){
        _controller.pause();
      }
     
      
    });
  }
}

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoController;

  const FullScreenVideoPlayer({Key? key, required this.videoController})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = widget.videoController.initialize();
    widget.videoController.play();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              if(widget.videoController.value.isPlaying){
                widget.videoController.pause();
              }else{
                widget.videoController.play();
              }
            },
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: widget.videoController.value.aspectRatio,
                    child: VideoPlayer(widget.videoController),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      
    );
  }
}
