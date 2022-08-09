import 'package:flutter/material.dart';
import 'package:jage_app/widget/SocialWidget.dart';

class SocialPage extends StatefulWidget {
  SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SocialPage"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            //SocialWidget(),
            //SocialWidget(),
            //SocialWidget(),
            //SocialWidget(),
          ],
        ),
      ),
    );
  }
}
