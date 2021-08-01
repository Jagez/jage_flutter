import 'package:flutter/material.dart';
import 'res/ListData.dart';
import 'res/ListImages.dart';

class FirstComponent extends StatelessWidget {

  List<Widget> _getInfo() {
    
    var data = listImage.map((value) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(233, 233, 233, 0.7),
            ),
          ),
          child: Column(
            children: [
              Image.asset(value['uri']),
              Text(
                value['title']
              ),
            ],
          ),
        );
      });
      return data.toList();
    
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(15.0),
      crossAxisSpacing: 15.0, //水平间距
      mainAxisSpacing: 15.0,  //垂直间距
      crossAxisCount: 2,
      //childAspectRatio: 0.7,  //宽/高比例
      children: this._getInfo(),
      );
  }
}
