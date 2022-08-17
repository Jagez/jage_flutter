import 'package:flutter/material.dart';
import 'package:jage_app/function/SocialInfo.dart';
import 'package:jage_app/widget/MediaWidget.dart';

import 'ContentText.dart';

class SocialWidget extends StatefulWidget {
  final SocialInfo info;
  SocialWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  List interactive = [
    {
      "id": 12,
      "likes": 22,
      "comments": {2, 34},
      "share": 44,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            leading: CircleAvatar(
              backgroundImage: Image.network(widget.info.header)
                  .image, //"http://jage.cktyun.com/a.png"
            ),
            title: Text(
              "飞天神喵",
              style: TextStyle(
                color: Color(0xFF3D69B4),
              ),
            ),
            subtitle: Text("jage"),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text("关注"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: ContentTextWidget(
              arguments: {
                "contentText": widget.info.content,
                'textDirection': TextDirection.rtl,
                'textStyle': TextStyle(color: Colors.black),
              },
            ),
          ),
          //MediaWidget(),
          Container(
            child: Wrap(
              //direction: Axis.horizontal,
              //alignment: WrapAlignment.start,
              spacing: 0.0,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("# 今天"),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 11.0,
                    ),
                    elevation: 0.0,
                    backgroundColor: Color(0xFFF1F7FF),
                    primary: Color(0xFF439CEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    // side: BorderSide(
                    //   color: Colors.green,
                    // ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("# 话题"),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 11.0,
                    ),
                    elevation: 0.0,
                    backgroundColor: Color(0xFFF1F7FF),
                    primary: Color(0xFF439CEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    // side: BorderSide(
                    //   color: Colors.green,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.thumb_up_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.forum_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.share_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
