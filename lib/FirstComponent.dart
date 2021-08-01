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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 15.0, //水平间距
        mainAxisSpacing: 15.0, //垂直间距
        crossAxisCount: 2,
      ),
      // padding: EdgeInsets.all(15.0),
      //childAspectRatio: 0.7,  //宽/高比例
      itemCount: listImage.length,
      itemBuilder: this._getInfo,
    );
  }
}
