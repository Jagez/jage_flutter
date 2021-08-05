import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../Tabs.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text("NewPage"),
        bottom: TabBar(
          isScrollable: true,                         //Tab比较多时允许滚动
          labelColor: Colors.yellowAccent,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.yellowAccent,
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(text: "Hot",),
            Tab(text: "Pop",),
          ],
        ),
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
          child: Text("Home"),
          onPressed: () {
            //返回根路由
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => new Tabs(),
                ),
                //将路由清空
                (route) => false);
            setState(() {
              this.content = widget.arguments['name'].toString();
            });
          },
        ),
      ),
    ),
    );
  }
}
