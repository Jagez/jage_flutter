import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NewPage.dart';
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text("Open"),
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>NewPage()
              )
            );
          },
        ),
        ElevatedButton(
          child: Text("Return"),
          onPressed: (){

          },
        ),
      ],
    );
  }
}