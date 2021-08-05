import 'package:flutter/material.dart';
import 'page/HomePage.dart';
import 'page/Setting.dart';
import 'page/Category.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _bottomNavIndex = 0;
  List<Widget> _tabsList = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    this._tabsList.add(HomePage());
    this._tabsList.add(CategoryPage());
    this._tabsList.add(Setting());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Jage Flutter",
          ),
          //定义可点击的图标按钮
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Image.asset("images/icon_quest_31002.png"),
              onPressed: () {},
            ),
          ],
          // bottom: TabBar(
          //   tabs: [
          //     Tab(text: "首页",),
          //     Tab(text: "热播",),
          //   ],
          // ),
          backgroundColor: Colors.black,
        ),
        body: this._tabsList[this._bottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Theme.of(context).accentColor,
          currentIndex: this._bottomNavIndex,
          onTap: (int index) {
            setState(() {
              this._bottomNavIndex = index;
            });
          },
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
    );
  }
}
