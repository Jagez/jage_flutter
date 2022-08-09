import 'package:flutter/material.dart';
import '../../widget/PopupMenu.dart';
import '../../widget/MessageItem.dart';
import 'package:badges/badges.dart';

class DesignPage extends StatefulWidget {
  DesignPage({Key? key}) : super(key: key);

  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  int _index = 0;

  static Map _bgColor = {'r': 30, 'g': 30, 'b': 73};
  static Map _bgTheme = {'r': 24, 'g': 24, 'b': 58};
  double point = 0.00;

  

  static Color _getBackgroundColor(double opacity) {
    return Color.fromRGBO(_bgColor['r'], _bgColor['g'], _bgColor['b'], opacity);
  }

  Color _getBGThemeColor(double opacity) {
    return Color.fromRGBO(_bgTheme['r'], _bgTheme['g'], _bgTheme['b'], opacity);
  }

  static  List<Widget> _widgetOptions = <Widget>[
    Container(
      width: double.infinity,
      color: _getBackgroundColor(1.0),
      child: ListView(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0x18183A),
            ),
            child: Row(
              children: [
                Text("data"),
                SizedBox(width: 30,),
                Text("data"),
              ],
            ),
          ),
          MessageItemWidget(targetId: 10,),
          MessageItemWidget(targetId: 11,),
          MessageItemWidget(targetId: 12,),
          MessageItemWidget(targetId: 13,),
          MessageItemWidget(targetId: 14,),
          MessageItemWidget(targetId: 15,),
          MessageItemWidget(targetId: 16,),
          MessageItemWidget(targetId: 17,),
          MessageItemWidget(targetId: 18,),
          MessageItemWidget(targetId: 19,),
          MessageItemWidget(targetId: 21,),
        ],
      ),
    ),
    Text("dsd"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: _getBackgroundColor(1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _getBackgroundColor(1.0),
        title: Text(
          "Jage",
          style: TextStyle(
            fontFamily: "loverROB",
            fontSize: 23.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          PopupMenuWidget(),
        ],
      ),
      body: _widgetOptions[_index],
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 86, 253, 1.0).withOpacity(0.5),
              offset: Offset(0.0, 4.0),
              blurRadius: 10,
              spreadRadius: 4,
            )
          ],
        ),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, '/charts');
            });
          },
          foregroundColor: Color.fromRGBO(8, 255, 255, 1.0),
          splashColor: Color.fromRGBO(8, 255, 255, 1.0),
          backgroundColor: Color.fromRGBO(0, 86, 253, 1.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 70.0,
        //color: Color.fromRGBO(30, 30, 73, 0.0),   //不能与decoration的color一起使用
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: _getBGThemeColor(1.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this._index,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Color.fromRGBO(8, 255, 255, 1.0),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.0),
          selectedLabelStyle: TextStyle(fontSize: 12.0, fontFamily: "SAO"),
          unselectedLabelStyle: TextStyle(fontSize: 12.0, fontFamily: "SAO"),
          onTap: (index) {
            setState(() {
              this._index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Icon(
                  Icons.chat_bubble,
                  size: 20.0,
                ),
              ),
              label: "Chats",
              backgroundColor: Color.fromRGBO(30, 30, 73, 0.0),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Icon(
                  Icons.people_alt,
                  size: 20.0,
                ),
              ),
              label: "Profile",
              backgroundColor: Color.fromRGBO(30, 30, 73, 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
