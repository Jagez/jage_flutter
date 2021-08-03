import 'package:flutter/material.dart';
//import 'FirstComponent.dart';
import 'tabs/Tabs.dart';
import 'tabs/page/NewPage.dart';
void main() {
  runApp(JageApp());
}
class JageApp extends StatelessWidget {
  final String str = '/page';
  const JageApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Tabs(),
        routes: {
          this.str: (context)=>(NewPage()),
        },
    );
  }
}