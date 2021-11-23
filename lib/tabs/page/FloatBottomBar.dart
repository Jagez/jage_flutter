import 'package:flutter/material.dart';

class FloatBottomBarPage extends StatefulWidget {
  FloatBottomBarPage({Key? key}) : super(key: key);

  @override
  _FloatBottomBarPageState createState() => _FloatBottomBarPageState();
}

class _FloatBottomBarPageState extends State<FloatBottomBarPage> {
  int _currentPageIndex = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatBottomBar"),
      ),
      body: Stack(
        children: [
          //1、主页面
          mainView(),
          //2、底部栏
          bottomBarView(),
        ],
      ),
    );
  }

  Positioned bottomBarView() {
    return Positioned(
          height: 50,
          bottom: 30,
          left: 30,
          right: 30,
          child: Material(
            color: Colors.black26,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            elevation: 3.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BarItem(Icons.home_rounded, 0),
                _BarItem(Icons.message_rounded, 1),
                _BarItem(Icons.cloud_circle_rounded, 2),
                _BarItem(Icons.person_rounded, 3),
              ],
            ),
          ),
        );
  }

  PageView mainView() {
    return PageView(
          controller: _controller,
          children: [
            _TempPage( num: 1, ),
            _TempPage( num: 2, ),
            _TempPage( num: 3, ),
            _TempPage( num: 4, ),
          ],
        );
  }

  Widget _BarItem(IconData icon, int index) {
    return InkWell(
      onTap: (){
        setState(() {
          _currentPageIndex = index;
          _controller.jumpToPage(index);
        });
      },
      child: AnimatedContainer(
          duration: Duration(microseconds: 6),
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            color: _currentPageIndex == index ? Colors.yellow[100] : null,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }
}

class _TempPage extends StatefulWidget {
  const _TempPage({
    Key? key,
    required this.num,
  }) : super(key: key);

  final int num;


  @override
  __TempPageState createState() => __TempPageState();
}

class __TempPageState extends State<_TempPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(child: Text(widget.num.toString())),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}