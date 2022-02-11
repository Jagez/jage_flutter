import 'package:flutter/material.dart';

class IndexBottomBar extends StatefulWidget {
  IndexBottomBar({Key? key}) : super(key: key);

  @override
  _IndexBottomBarState createState() => _IndexBottomBarState();
}

class _IndexBottomBarState extends State<IndexBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                });
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
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
                });
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
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
                });
              },
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
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
                });
              },
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Icon(Icons.people_outlined),
                  Text("Profile"),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(10),
          //   child: GestureDetector(
          //     onTap: (){
          //       setState(() {
          //         _bottomNavIndex = 3;
          //       });
          //     },
          //     child: Wrap(
          //       direction: Axis.vertical,
          //       crossAxisAlignment: WrapCrossAlignment.center,
          //       children: <Widget>[
          //         Icon(Icons.people_outlined),
          //         Text("Profile"),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}