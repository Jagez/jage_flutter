import 'package:flutter/material.dart';

class DatesPage extends StatefulWidget {
  DatesPage({Key? key}) : super(key: key);

  @override
  _DatesPageState createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatesPage"),
      ),
      body: Text(
        DateTime.now().toString(),
        style: TextStyle(
          fontFamily: "DIGI",
          fontSize: 18.0
        ),
      ),
    );
  }
}