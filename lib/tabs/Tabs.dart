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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jage Flutter",
        ),
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
    );
  }
}
