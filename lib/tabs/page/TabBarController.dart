import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key? key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    this._tabController.dispose();
  }

  @override
  void initState() {
    super.initState();

    //init TabController
    _tabController = new TabController(
      length: 3, 
      vsync: this,
    );
    _tabController.addListener(() {
      print(this._tabController.index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "xxx",),
            Tab(text: "ooo",),
            Tab(text: "ooo",),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: [
          Center(
            child: Text("xxx"),
          ),
          Center(
            child: Text("ooo"),
          ),
          Center(
            child: Text("ooo"),
          ),
        ],
      ),
    );
  }
}