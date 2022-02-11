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
        appBar: AppBar(
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
          backgroundColor: Colors.black,
        ),
        endDrawer: Drawer(),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF592BBC),Color(0xFF8455E8)],
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
                  accountEmail: Text(
                    "lwk283587151@outlook.com",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF592BBC),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
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
                  padding: const EdgeInsets.only(left: 20.0),
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
          onPressed: () {
            
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),

      //child: CustomBottomAppBar(),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      elevation: 0,
      shape: CircularNotchedRectangle(),
      color: Colors.yellow,
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // children: [
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       child: Wrap(
        //         crossAxisAlignment: WrapCrossAlignment.center,
        //         direction: Axis.vertical,
        //         children: <Widget>[
        //           Icon(Icons.home),
        //           Text("Home"),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: (){
        //         setState(() {
        //         });
        //       },
        //       child: Wrap(
        //         crossAxisAlignment: WrapCrossAlignment.center,
        //         direction: Axis.vertical,
        //         children: <Widget>[
        //           Icon(Icons.category),
        //           Text("Category"),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: (){
        //         setState(() {
        //         });
        //       },
        //       child: Wrap(
        //         direction: Axis.vertical,
        //         crossAxisAlignment: WrapCrossAlignment.center,
        //         children: <Widget>[
        //           Icon(Icons.settings),
        //           Text("Setting"),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: GestureDetector(
        //       onTap: (){
        //         setState(() {
        //         });
        //       },
        //       child: Wrap(
        //         direction: Axis.vertical,
        //         crossAxisAlignment: WrapCrossAlignment.center,
        //         children: <Widget>[
        //           Icon(Icons.people_outlined),
        //           Text("Profile"),
        //         ],
        //       ),
        //     ),
        //   ),
        //   // Padding(
        //   //   padding: EdgeInsets.all(10),
        //   //   child: GestureDetector(
        //   //     onTap: (){
        //   //       setState(() {
        //   //         _bottomNavIndex = 3;
        //   //       });
        //   //     },
        //   //     child: Wrap(
        //   //       direction: Axis.vertical,
        //   //       crossAxisAlignment: WrapCrossAlignment.center,
        //   //       children: <Widget>[
        //   //         Icon(Icons.people_outlined),
        //   //         Text("Profile"),
        //   //       ],
        //   //     ),
        //   //   ),
        //   // )
        // ],

        children: info.asMap().keys.map((i) => _buildChild(i)).toList()
            ..insertAll(isCenter ? 2 : 4, [SizedBox(width: 30)]),
      ),
    );
  }

  List<String> get info => iconsMap.keys.toList();

  bool get isCenter => _location == FloatingActionButtonLocation.centerDocked;

  Widget _buildChild(int i) {
    var active = i == _position;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => setState(() => _position = i),
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Icon(
              iconsMap[info[i]],
              color: active ? activeColor : Colors.white,
              size: 30,
            ),
            Text(info[i],
                style: TextStyle(
                    color: active ? activeColor : Colors.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }

}
