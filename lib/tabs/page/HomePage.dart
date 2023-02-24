import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../widget/BottomSheetWidget.dart';
import '../../widget/DemoListWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  bool _bHidden = false;

@override
  void initState() {
    super.initState();

    //启用监听生命周期状态
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance!.removeObserver(this);
  }

//
//  监听生命周期状态
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: $_bHidden");
    setState(() {
      _bHidden = state != AppLifecycleState.resumed;
    });
    switch(state)
    {
      
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        //_bHidden = true;
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title可以是widget，所有可以把TabBar写在title中，而不是bottom
          title: TabBar(
            tabs: [
              Tab(
                text: "ooo",
              ),
              Tab(
                text: "xxx",
              ),
            ],
          ),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(text: "ss",),
          //     Tab(text: "xx",),
          //   ],
          // ),
        ),
        body: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification){
                ScrollMetrics scrollMetrics = notification.metrics;
                //print("axis: ${scrollMetrics.axis}");     //轴
                //print("pixels: ${scrollMetrics.pixels}"); //当前的像素x/y坐标
                //print("atEdge: ${scrollMetrics.atEdge}"); //是否在两端
                return true;
              },
              child: TabBarView(
                children: [
                  DemoListWidget(),
                  DemoListWidget(),
                ],
              )
            ),
            if(_bHidden) Container(color: Colors.orange,),
          ],
        ));
  }
}
