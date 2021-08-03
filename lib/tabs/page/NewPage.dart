import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewPage"),
      ),
      body: Text("I'm content in the new page."),
      floatingActionButton: FloatingActionButton(
        child: Text("Back"),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
    );
  }
}