import 'package:flutter/material.dart';
import 'ContentText.dart';

class ChartsContent extends StatefulWidget {
  ChartsContent({Key? key}) : super(key: key);

  @override
  _ChartsContentState createState() => _ChartsContentState();
}

class _ChartsContentState extends State<ChartsContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 15, 5, 10),
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
                  "contentText":
                      "fslakjfsasdfsdfadsfasdfewrwrefsdfsdfewrwdsfasdgwerwerwdfaldfkjslfjksl但是咖啡机拉萨的飞机塑料袋放进离开即使对方螺丝扣搭街坊",
                  'textDirection': TextDirection.rtl,
                  'textStyle': TextStyle(
                    color: Color.fromRGBO(244, 244, 247, 1.0),
                  ),
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
