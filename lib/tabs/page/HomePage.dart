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

class _HomePageState extends State<HomePage> {

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
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification){
            ScrollMetrics scrollMetrics = notification.metrics;
            print("axis: ${scrollMetrics.axis}");     //轴
            print("pixels: ${scrollMetrics.pixels}"); //当前的像素x/y坐标
            print("atEdge: ${scrollMetrics.atEdge}"); //是否在两端
            return true;
          },
          child: TabBarView(
            children: [
              DemoListWidget(),
              DemoListWidget(),
            ],
          )
        ));
  }
}
