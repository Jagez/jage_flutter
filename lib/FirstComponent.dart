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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300.0,
          height: 300.0,
          color: Colors.yellow,
        ),
        Image.asset("images/icon_quest_31002.png")
      ],
    );
  }
}

class IconContainer extends StatelessWidget {
  IconData _iconData;
  double? size = 32.0;
  Color? color = Colors.yellow;

  IconContainer(this._iconData, {this.color, this.size}) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 128.0,
      width: 128.0,
      color: this.color,
      child: Center(
        child: Icon(
          this._iconData,
          size: this.size,
        ),
      ),
    );
  }
}
