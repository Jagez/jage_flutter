import 'package:flutter/material.dart';

class ContentTextWidget extends StatefulWidget {
  final dynamic arguments;

  ContentTextWidget({Key? key, this.arguments}) : super(key: key);

  @override
  _ContentTextWidgetState createState() => _ContentTextWidgetState();
}

class _ContentTextWidgetState extends State<ContentTextWidget> {
  late String _contentText;
  int contentMaxLines = 2;
  bool _expandFlag = true;
  TextDirection _textDirection = TextDirection.ltr;
  late TextStyle _textStyle;
  //late BoxDecoration _decoration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _contentText = widget.arguments['contentText'];
    _textDirection = widget.arguments['textDirection'];
    _textStyle = widget.arguments['textStyle'];
    //_decoration = widget.arguments['decoration'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: _decoration,
      child: LayoutBuilder(
        builder: (context, size) {
          final painter = TextPainter(
            text: TextSpan(
              text: _contentText,
            ),
            maxLines: contentMaxLines,
            textDirection: _textDirection,
          );
          painter.layout(maxWidth: size.maxWidth);
          if (!painter.didExceedMaxLines) {
            return Text(
              _contentText,
              style: _textStyle,
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _contentText,
                maxLines: _expandFlag ? null : 2,
                style: _textStyle,
              ),
            ],
          );
        },
      ),
    );
  }
}
