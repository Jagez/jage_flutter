import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaWidget extends StatefulWidget {
  MediaWidget({Key? key}) : super(key: key);
  //播放器控制器
  late VideoPlayerController _videoPlayerController;
  String duration = '';

  @override
  State<MediaWidget> createState() => _MediaWidgetState();

  void play() {
    _videoPlayerController.value.isPlaying
        ? _videoPlayerController.pause()
        : _videoPlayerController.play();
  }
}

class _MediaWidgetState extends State<MediaWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._videoPlayerController = VideoPlayerController.network(
        'http://jage.cktyun.com/1.mp4') //http://jage.cktyun.com/1.mp4
      ..initialize().then((_) {
        setState(() {
          if (widget._videoPlayerController.value.isInitialized) {}
        });
      });
    widget.duration = widget._videoPlayerController.value.duration.toString();
    //播放状态发生变化时会调用
    widget._videoPlayerController.addListener(() {
      setState(() {
        widget.duration =
            widget._videoPlayerController.value.position.toString();
      });
    });
    widget._videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return widget._videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio: widget._videoPlayerController.value.aspectRatio,
            child: VideoPlayer(widget._videoPlayerController),
          )
        : Container();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget._videoPlayerController.dispose();
  }
}
