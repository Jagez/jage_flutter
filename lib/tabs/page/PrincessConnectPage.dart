import 'package:flutter/material.dart';

class PrincessConnectPage extends StatefulWidget {
  PrincessConnectPage({Key? key}) : super(key: key);

  @override
  State<PrincessConnectPage> createState() => _PrincessConnectPageState();
}

class _PrincessConnectPageState extends State<PrincessConnectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 65, 1.0),
      extendBody: true,
      appBar: AppBar(
        title: Text("公主连结"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/music');
                },
                child: Text("音乐播放列表")),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/battle');
              },
              child: Text("公会战分刀"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      elevation: 2,
      shape: CircularNotchedRectangle(),
      color: Colors.yellow,
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
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
              onTap: () {
                setState(() {});
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
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {});
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
              onTap: () {
                setState(() {});
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

        // children: info.asMap().keys.map((i) => _buildChild(i)).toList()
        //     ..insertAll(isCenter ? 2 : 4, [SizedBox(width: 30)]),
      ),
    );
  }
}
