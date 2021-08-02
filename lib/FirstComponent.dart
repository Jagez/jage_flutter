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
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16.0/9.0,
                child: Image.asset(
                  "images/thumb_unit_profile_100211.png",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("icon_quest_31001"),  //暂没创建assert目录
                ),
                title: Text("Jage"),
                subtitle: Text("xxx"),
              ),
            ],
          ),
        ),
      ]
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
