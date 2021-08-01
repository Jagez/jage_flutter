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
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
            child: Image.asset(
              "images/thumb_unit_profile_100211.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
