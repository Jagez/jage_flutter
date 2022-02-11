import 'dart:math';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

Map _bgColor = {'r': 30, 'g': 30, 'b': 73};
Map _bgTheme = {'r': 24, 'g': 24, 'b': 58};

Color _getBackgroundColor(double opacity) {
  return Color.fromRGBO(_bgColor['r'], _bgColor['g'], _bgColor['b'], opacity);
}

Color _getBGThemeColor(double opacity) {
  return Color.fromRGBO(_bgTheme['r'], _bgTheme['g'], _bgTheme['b'], opacity);
}

class MessageItemWidget extends StatefulWidget {
  final int targetId;
  MessageItemWidget({Key? key, required this.targetId}) : super(key: key);

  @override
  _MessageItemWidgetState createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onHorizontalDragStart: (DragStartDetails dragStartDetails) {
          print(dragStartDetails.globalPosition);
        },
        onHorizontalDragUpdate: (DragUpdateDetails updateDetails) {
          print(updateDetails.globalPosition);
        },
        onTap: () {
          //print(widget.key.toString());
          setState(() {
            Navigator.pushNamed(
              context
              , '/charts'
              , arguments: {
                  "targetId": widget.targetId,
                }
              );
          });
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _getBGThemeColor(1.0)),
            child: ListTile(
              leading: Hero(
                tag: widget.targetId.toString(),
                child: CircleAvatar(
                backgroundImage: AssetImage("images/icon_quest_31002.png"),
              ),
              ),
              title: Text(
                "Jage",
                style: TextStyle(color: Colors.white, fontFamily: "SAO"),
              ),
              subtitle: Text(
                "MIT Assistant manager",
                style: TextStyle(
                  color: Colors.white30,
                  fontFamily: "SAO",
                ),
              ),
              trailing: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 5, 0),
                    child: Badge(
                      badgeContent: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SAO',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 2, 5, 0),
                    child: Text(
                      "2 mini ago",
                      style: TextStyle(
                        color: Colors.white30,
                        fontFamily: "SAO",
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
