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
      height: 400.0,
      width: 400.0,
      color: Colors.yellow,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(1.0, -0.3),
            child: Image.asset("images/icon_quest_31002.png"),
          ),
          Align(
            alignment: Alignment(0.3, 1.0),
            child: Image.asset("images/icon_quest_31002.png"),
          ),
          Align(
            alignment: Alignment(-1.0, 0.3),
            child: Image.asset("images/icon_quest_31002.png"),
          ),
          Align(
            alignment: Alignment(-0.3, -1.0),
            child: Image.asset("images/icon_quest_31002.png"),
          ),
        ],
      ),
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
