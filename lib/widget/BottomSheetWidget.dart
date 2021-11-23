import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({Key? key}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("分享"),
    );
  }
}