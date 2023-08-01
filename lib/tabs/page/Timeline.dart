import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("timeline"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimelineTile(
              //afterLineStyle,线条样式
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              //指示器样式
              indicatorStyle: IndicatorStyle(
                width: 64.0,
                height: 64.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                indicator: Image.asset("assets/icon/318.png"),
                // iconStyle: IconStyle(
                //   color: Colors.pink,
                //   iconData: Icons.inbox_rounded),
              ),
              hasIndicator: true,       //是否有指示器
              isFirst: true,               //是否是开始
              lineXY: 0.6,               // xy轴的大小比例
              axis: TimelineAxis.vertical,  // 当前时间线的轴方向
              alignment: TimelineAlign.manual,
              // startChild: Container(
              //   constraints: const BoxConstraints(
              //     minHeight: 120,
              //   ),
              //   color: Colors.yellowAccent,
              // ),
              endChild: Container(
                color: Colors.blueAccent,
              ),

            ),
            TimelineTile(
              alignment: TimelineAlign.manual,
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              indicatorStyle: IndicatorStyle(),
              lineXY: 0.6,
            ),

            TimelineTile(
              //afterLineStyle,线条样式
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              //指示器样式
              indicatorStyle: IndicatorStyle(
                width: 64.0,
                height: 64.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                indicator: Image.asset("assets/icon/318.png"),
                // iconStyle: IconStyle(
                //   color: Colors.pink,
                //   iconData: Icons.inbox_rounded),
              ),
              hasIndicator: true,       //是否有指示器
              isFirst: false,               //是否是开始
              lineXY: 0.6,               // xy轴的大小比例
              axis: TimelineAxis.vertical,  // 当前时间线的轴方向
              alignment: TimelineAlign.manual,
              startChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                color: Colors.yellowAccent,
              ),
              // endChild: Container(
              //   color: Colors.blueAccent,
              // ),
            ),

            const TimelineDivider(
              axis: TimelineAxis.horizontal,      //指定轴向
              begin: 0.6,
              end: 0.9,
              thickness: 5,
              color: Colors.deepOrangeAccent,
            ),

            TimelineTile(
              alignment: TimelineAlign.manual,
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              indicatorStyle: IndicatorStyle(),
              lineXY: 0.9,
            ),

            TimelineTile(
              //afterLineStyle,线条样式
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              //指示器样式
              indicatorStyle: IndicatorStyle(
                width: 64.0,
                height: 64.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                indicator: Image.asset("assets/icon/318.png"),
                // iconStyle: IconStyle(
                //   color: Colors.pink,
                //   iconData: Icons.inbox_rounded),
              ),
              hasIndicator: true,       //是否有指示器
              isFirst: false,               //是否是开始
              lineXY: 0.9,               // xy轴的大小比例
              axis: TimelineAxis.vertical,  // 当前时间线的轴方向
              alignment: TimelineAlign.manual,
              startChild: Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                ),
                color: Colors.yellowAccent,
              ),
              endChild: Container(
                // color: Colors.blueAccent,
              ),
            ),
            
            TimelineTile(
              alignment: TimelineAlign.manual,
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              indicatorStyle: IndicatorStyle(),
              lineXY: 0.9,
            ),

            const TimelineDivider(
              axis: TimelineAxis.horizontal,      //指定轴向
              begin: 0.3,
              end: 0.9,
              thickness: 5,
              color: Colors.deepOrangeAccent,
            ),

            TimelineTile(
              //afterLineStyle,线条样式
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              //指示器样式
              indicatorStyle: IndicatorStyle(
                width: 64.0,
                height: 64.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                indicator: Image.asset("assets/icon/318.png"),
                // iconStyle: IconStyle(
                //   color: Colors.pink,
                //   iconData: Icons.inbox_rounded),
              ),
              hasIndicator: true,       //是否有指示器
              isFirst: false,               //是否是开始
              lineXY: 0.3,               // xy轴的大小比例
              axis: TimelineAxis.vertical,  // 当前时间线的轴方向
              alignment: TimelineAlign.manual,
              // startChild: Container(
              //   constraints: const BoxConstraints(
              //     minHeight: 120,
              //   ),
              //   color: Colors.yellowAccent,
              // ),
              endChild: Container(
                color: Colors.blueAccent,
              ),
            ),

            TimelineTile(
              alignment: TimelineAlign.manual,
              beforeLineStyle: const LineStyle(
                color: Colors.deepOrangeAccent,
                thickness: 5,
              ),
              indicatorStyle: IndicatorStyle(),
              lineXY: 0.3,
            ),
            const TimelineDivider(
              axis: TimelineAxis.horizontal,      //指定轴向
              begin: 0.3,
              end: 0.5,
              thickness: 5,
              color: Colors.deepOrangeAccent,
            ),

          ],
        ),
      ),
    );
  }
}