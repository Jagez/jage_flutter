import 'package:flutter/material.dart';

class QuestionItemWidget extends StatefulWidget {
  final dynamic arguments;
  QuestionItemWidget({Key? key, this.arguments}) : super(key: key);

  @override
  State<QuestionItemWidget> createState() => _QuestionItemWidgetState();
}

class _QuestionItemWidgetState extends State<QuestionItemWidget> {
  late String _chapterText;
  late String _questionText;
  late List<String> _selectList;
  int contentMaxLines = 2;
  late int _selectIndex;
  bool _expandFlag = true;
  TextDirection _textDirection = TextDirection.ltr;
  late TextStyle _textStyle;
  String currValue = "0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chapterText = widget.arguments['chapter'];
    _questionText = widget.arguments['questionText'];
    _selectList = widget.arguments['selectList'];
    _selectIndex = widget.arguments['selectIndex'];
    _textDirection = widget.arguments['textDirection'];
    _textStyle = widget.arguments['textStyle'];
  }

  @override
  Widget build(BuildContext context) {
    print(widget.arguments.toString());
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          final painter = TextPainter(
            text: TextSpan(
              text: _chapterText,
            ),
            maxLines: contentMaxLines,
            textDirection: _textDirection,
          );
          painter.layout(maxWidth: size.maxWidth);
          // if (!painter.didExceedMaxLines) {
          //   return Text(
          //     _chapterText,
          //     style: _textStyle,
          //   );
          // }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _chapterText,
                maxLines: _expandFlag ? null : 2,
                style: _textStyle,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _questionText,
                  maxLines: _expandFlag ? null : 2,
                  style: _textStyle,
                ),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: _selectList[0].toString(),
                //isThreeLine: true,
                //dense: true,
                groupValue: currValue,
                title: Text(_selectList[0]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: _selectList[1].toString(),
                groupValue: currValue,
                title: Text(_selectList[1]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: _selectList[2].toString(),
                groupValue: currValue,
                title: Text(_selectList[2]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: _selectList[3].toString(),
                groupValue: currValue,
                title: Text(_selectList[3]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
