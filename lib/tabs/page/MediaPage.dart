import 'package:flutter/material.dart';
import 'package:jage_app/widget/MediaWidget.dart';

class MediaPage extends StatefulWidget {
  MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  GlobalKey sonKey = GlobalKey();
  late MediaWidget _mediaWidget;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mediaWidget = new MediaWidget(
      key: sonKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("多媒体"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: isPlaying ? Text("暂停") : Text("播放"),
            onPressed: () {
              setState(() {
                _mediaWidget.play();
                isPlaying = !isPlaying;
              });
            },
          ),
          Text(_mediaWidget.duration),
          DecoratedBox(decoration: BoxDecoration())
        ],
      ),
    );
  }
}
