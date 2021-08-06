import 'package:flutter/material.dart';
import 'package:jage_app/tabs/page/NewPage.dart';
import 'page/HomePage.dart';
import 'page/Setting.dart';
import 'page/Category.dart';
import 'page/News.dart';
import 'page/Zoom.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _bottomNavIndex = 0;
  final List<Widget> _tabsList = [
    HomePage(), 
    CategoryPage(),
    Setting(),
    NewsPage(),
    ZoomPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
        endDrawer: Drawer(),
        drawer: Drawer(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "images/thumb_unit_profile_100231.png"),
                        ),
                      ),
                      child: Image.asset("images/icon_quest_31002.png"),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text("用户中心"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/userinfo');
                },
              ),
            ],
          ),
        ),
        body: this._tabsList[this._bottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.yellow,
          iconSize: 30.0,
          fixedColor: Theme.of(context).accentColor,
          currentIndex: this._bottomNavIndex,
          onTap: (int index) {
            setState(() {
              this._bottomNavIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "发布",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Zoom",
            ),
          ],
        ),
        floatingActionButton: Container(
          width: 80.0,
          height: 80.0,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 40,
            ),
            backgroundColor: Colors.yellow,
            onPressed: () {
              setState(() {
                this._bottomNavIndex =  this._tabsList.length ~/ 2;
                //this._bottomNavIndex = 2;
              });
              print(this._bottomNavIndex);
              print(this._tabsList.length);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
