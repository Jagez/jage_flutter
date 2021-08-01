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
      width: 750.0,
      color: Colors.orange,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,     //Y轴上的布局
        //crossAxisAlignment: CrossAxisAlignment.start,         //X轴上的布局
        children: [
          Expanded(
            flex: 1,
            child: IconContainer(
              Icons.search,
              color: Colors.blue,
              size: 32,
            ),
          ),
          Expanded(
            flex: 2,
            child: IconContainer(
              Icons.file_copy_sharp,
              size: 32,
            ),
          ),
          IconContainer(
            Icons.home,
            color: Colors.red,
            size: 32,
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
