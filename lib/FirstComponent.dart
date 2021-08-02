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
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Wrap(
          direction: Axis.vertical,     //主轴的方向 默认时水平 horizental
          alignment: WrapAlignment.spaceBetween,
          spacing: 15.0,        //此时主轴元素之间的间距---X
          runSpacing: 15.0,     //此时次轴元素之间的间距---Y
          children: [
            ElevatedButton(
              child: Text("jagejagejagejagejagejagejage"),
              //style: ,
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("jssqqqqage"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("jafsjagejagejagege"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("jsdage"),
              onPressed: () {},
            ),
          ]),
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
