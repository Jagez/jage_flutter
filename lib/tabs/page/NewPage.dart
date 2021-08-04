import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class NewPage extends StatefulWidget {
  final dynamic arguments;
  NewPage({Key? key, this.arguments}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String content = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewPage"),
      ),
      body: Center(
        child: Badge(
          badgeContent: Text(widget.arguments['name']),
          child: Image.asset("images/icon_quest_31020.png"),
        ),
      ),
      floatingActionButton: Badge(
        badgeContent: Text(
          this.content,
          style: TextStyle(fontSize: 18.0),
        ),
        child: FloatingActionButton(
          child: Text("Get"),
          onPressed: () {
            //Navigator.of(context).pop();
            setState(() {
              this.content = widget.arguments['name'].toString();
            });
          },
        ),
      ),
    );
  }
}
