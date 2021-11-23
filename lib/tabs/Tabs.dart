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
            style: TextStyle(
              fontFamily: "loverROB",
            ),
          ),
          //定义可点击的图标按钮
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
            },
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
        //backgroundColor: Color.fromRGBO(30, 30, 30, 0.0),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.yellow,
          notchMargin: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _bottomNavIndex = 0;
                    });
                  },
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Icon(Icons.home),
                      Text("Home"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _bottomNavIndex = 1;
                    });
                  },
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Icon(Icons.category),
                      Text("Category"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _bottomNavIndex = 2;
                    });
                  },
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Icon(Icons.settings),
                      Text("Setting"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _bottomNavIndex = 3;
                    });
                  },
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people_outlined),
                      Text("Profile"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 60.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          //margin: EdgeInsets.only(bottom: 2.0),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(40.0),
          //   color: Colors.white,
          // ),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(50.0),
          //     // boxShadow: [
          //     //   BoxShadow(
          //     //     color: Colors.yellow, //.withOpacity(0.5)
          //     //     //offset: Offset(-6.0,-6.0),
          //     //     blurRadius: 0,
          //     //     spreadRadius: 10,
          //     //   ),
          //     // ]
          //     ),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 40,
            ),
            //focusColor: Colors.red,
            //foregroundColor: Colors.yellowAccent,
            //hoverColor: Colors.yellowAccent,
            //高亮时候的阴影
            highlightElevation: 0.0,
            elevation: 10.0,
            splashColor: Colors.yellowAccent,
            backgroundColor: Colors.yellow,
            onPressed: () {
              setState(() {
                this._bottomNavIndex = this._tabsList.length ~/ 2;
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
