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
        body: MyHome(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int itemNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Chip(
        //   label: Text("${this.itemNum}"),
        // ),
        Text("${this.itemNum}"),
        ElevatedButton(
          child: Text("Let's go."),
          onPressed: () {
            setState(() {
              this.itemNum++;
            });
          },
        ),
      ],
    );
  }
}
