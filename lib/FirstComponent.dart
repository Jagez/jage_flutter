import 'package:flutter/material.dart';
import 'res/ListData.dart';
import 'res/ListImages.dart';

class FirstComponent extends StatelessWidget {
  Widget _getInfo(content, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Color.fromRGBO(233, 233, 233, 0.7),
        ),
      ),
      child: Column(
        children: [
          Image.asset(listImage[index]['uri']),
          Text(listImage[index]['title']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      width: 400.0,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,     //Y轴上的布局
        crossAxisAlignment: CrossAxisAlignment.start,         //X轴上的布局
        children: [
          Image.asset("images/icon_quest_31075.png"),
          Image.asset("images/icon_quest_31075.png"),
          Image.asset("images/icon_quest_31075.png"),
          Image.asset("images/icon_quest_31075.png"),
        ],
      ),
    );
  }
}
