import 'package:flutter/material.dart';
import 'package:jage_app/tabs/page/NewPage.dart';
import 'package:jage_app/widget/IndexBottomBarWidget.dart';
import 'package:jage_app/widget/testWidget.dart';
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
  ];

  var _position = 0;
  bool bShowDetail = false;
  var _location = FloatingActionButtonLocation.centerDocked;
  final iconsMap = {
    "图鉴": Icons.home,
    "动态": Icons.toys,
    "喜欢": Icons.favorite,
    "手册": Icons.class_,
  };
  var activeColor = Colors.blue.withAlpha(240);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true, //bottombar缺口为透明
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Jage Flutter",
            style: TextStyle(
              fontFamily: "loverROB",
            ),
          ),
          //定义可点击的图标按钮
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //   },
          // ),
          // actions: [
          //   IconButton(
          //     icon: Image.asset("images/icon_quest_31002.png"),
          //     onPressed: () {},
          //   ),
          // ],
          // bottom: TabBar(
          //   tabs: [
          //     Tab(text: "首页",),
          //     Tab(text: "热播",),
          //   ],
          // ),
          //backgroundColor: Colors.black,
        ),
        endDrawer: Drawer(),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF592BBC), Color(0xFF8455E8)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     Expanded(
                //       child: DrawerHeader(
                //         // decoration: BoxDecoration(
                //         //   image: DecorationImage(
                //         //     fit: BoxFit.cover,
                //         //     image: AssetImage(
                //         //         "images/thumb_unit_profile_100231.png"),
                //         //   ),
                //         // ),
                //         child: Image.asset("images/icon_quest_31002.png"),
                //       ),
                //     )
                //   ],
                // ),
                UserAccountsDrawerHeader(
                  otherAccountsPictures: [
                    FlutterLogo(
                      textColor: Colors.green,
                    ),
                    FlutterLogo(
                      textColor: Colors.green,
                    ),
                  ],
                  arrowColor: Colors.white,
                  onDetailsPressed: () {
                    setState(() {
                      bShowDetail = !bShowDetail;
                    });
                  },
                  decoration: BoxDecoration(
                    color: Color(0xFF8455E8),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/icon/a10.png"),
                  ),
                  accountName: Text(
                    "飞天神喵",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF592BBC),
                    ),
                  ),
                  accountEmail: Container(
                    child: Text(
                      "lwk283587151@outlook.com",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF592BBC),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Image.asset("assets/icon/Songs.png"),
                    //trailing: ,
                    title: Text("用户中心"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/userinfo');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Image.asset("assets/icon/Songs.png"),
                    //trailing: ,
                    title: Text("用户中心"),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/userinfo');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        body: this._tabsList[this._bottomNavIndex],
        //backgroundColor: Color.fromRGBO(30, 30, 30, 0.1),
        bottomNavigationBar: _buildBottomBar(),
        //backgroundColor: Colors.transparent,

        // floatingActionButton: FloatingActionButton(
        //     child: Icon(
        //       Icons.add,
        //       color: Colors.black,
        //       size: 40,
        //     ),
        //     //focusColor: Colors.red,
        //     //foregroundColor: Colors.yellowAccent,
        //     //hoverColor: Colors.yellowAccent,
        //     //高亮时候的阴影
        //     //highlightElevation: 0.0,
        //     //elevation: 10.0,
        //     //splashColor: Colors.yellowAccent,
        //     //backgroundColor: Colors.yellow,
        //     onPressed: () {
        //       setState(() {
        //         //this._bottomNavIndex = this._tabsList.length ~/ 2;
        //         //this._bottomNavIndex = 2;
        //       });
        //     },
        //   ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),

      //child: CustomBottomAppBar(),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      //elevation: 2,
      shape: CircularNotchedRectangle(),
      color: Colors.yellow,
      clipBehavior: Clip.antiAlias,
      notchMargin: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // children: [
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       child: Container(
        //         height: 50,
        //         child: Column(
        //           //crossAxisAlignment: WrapCrossAlignment.center,
        //           //direction: Axis.vertical,
        //           children: <Widget>[
        //             Icon(Icons.home),
        //             Text("首页"),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: () {
        //         setState(() {});
        //       },
        //       child: Container(
        //         height: 50,
        //         child: Column(
        //           //crossAxisAlignment: WrapCrossAlignment.center,
        //           //direction: Axis.vertical,
        //           children: <Widget>[
        //             Icon(Icons.category),
        //             Text("分类"),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 45,
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: () {
        //         setState(() {});
        //       },
        //       child: Container(
        //         height: 50,
        //         child: Column(
        //           //direction: Axis.vertical,
        //           //crossAxisAlignment: WrapCrossAlignment.center,
        //           children: <Widget>[
        //             Icon(Icons.settings),
        //             Text("动态"),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: () {
        //         setState(() {});
        //       },
        //       child: Container(
        //         height: 50,
        //         child: Column(
        //           //direction: Axis.vertical,
        //           //crossAxisAlignment: WrapCrossAlignment.center,
        //           children: <Widget>[
        //             Icon(Icons.people_outlined),
        //             Text("我的"),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ],

        children: info.asMap().keys.map((i) => _buildChild(i)).toList()
          ..insertAll(isCenter ? 2 : 4, [SizedBox(width: 45)]),
      ),
    );
  }

  List<String> get info => iconsMap.keys.toList();

  bool get isCenter => _location == FloatingActionButtonLocation.centerDocked;

  Widget _buildChild(int i) {
    var active = i == _position;
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _bottomNavIndex = i;
          });
        },
        child: Container(
          height: 50,
          child: Column(
            //direction: Axis.vertical,
            //crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(
                iconsMap[info[i]],
                color: active ? activeColor : Colors.white,
                size: 25,
              ),
              Text(info[i],
                  style: TextStyle(
                      color: active ? activeColor : Colors.white,
                      fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
