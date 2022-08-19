import 'package:flutter/material.dart';
import 'ContentText.dart';

class ChartsContent extends StatefulWidget {
  final dynamic arguments;
  ChartsContent({Key? key, this.arguments}) //Map<dynamic, List<String>> map
      : super(key: key);

  @override
  _ChartsContentState createState() => _ChartsContentState();
}

class _ChartsContentState extends State<ChartsContent> {
  late String _contentText;
  TextDirection _textDirection = TextDirection.ltr;
  late TextStyle _textStyle;
  //late int _id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _contentText = widget.arguments['contentText'];
    _textDirection = widget.arguments['textDirection'];
    _textStyle = widget.arguments['textStyle'];
    //_id = widget.arguments['id'];
    //_decoration = widget.arguments['decoration'];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Expanded(
          flex: 0,
          child: Container(
            //width: 360,
            margin: EdgeInsets.fromLTRB(20, 15, 5, 10),
            constraints: BoxConstraints(maxWidth: 290),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: Color.fromRGBO(40, 40, 97, 1.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ContentTextWidget(
                arguments: {
                  'contentText': _contentText,
                  'textDirection': _textDirection, //TextDirection.rtl
                  'textStyle': _textStyle,
                  //'decoration': BoxDecoration(),
                },
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundImage: Image.network("http://jage.cktyun.com/a.png")
              .image, //"http://jage.cktyun.com/a.png"
        )
      ],
    );
  }
}
