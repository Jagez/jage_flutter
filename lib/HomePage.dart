import 'package:flutter/material.dart';
import 'FirstComponent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Jage Flutter",
          ),
        ),
        body: FirstComponent(),

      ),

      theme: ThemeData(
        primarySwatch: Colors.red
      ),
    );
  }
}