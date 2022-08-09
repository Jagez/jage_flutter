import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jage_app/function/JageFileManager.dart';
import 'package:jage_app/res/ListImages.dart';
import 'package:jage_app/widget/FileSelectIconWidget.dart';
import 'package:path_provider/path_provider.dart';

class FileManager extends StatefulWidget {
  FileManager({Key? key}) : super(key: key);

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  int _touchIndex = -1;
  int currIndex = 0;

  List<PieChartSectionData> _getPieChartData() {
    return List.generate(4, (index) {
      final bool isTouched = index == _touchIndex;
      final double fontSize = isTouched ? 25.0 : 16.0;
      final double radius = isTouched ? 60.0 : 50.0;
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Color(0xFF508AFF),
            value: 40.0,
            title: '40%',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: Color(0xFFFFC355),
            value: 10.0,
            title: '10%',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: Color(0xFFFF7EAD),
            value: 5.0,
            title: '5%',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: Color(0xFF8255FF),
            value: 45.0,
            title: '45%',
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }

  Widget _buildSpaceDataWidget(String title, int size) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w300),
          ),
          Spacer(),
          Text(
            size.toString() + " MB",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  List<Widget> _getOtherDirctoryWidget() {
    var data = otherDirectoryList.map((value) {
      return GestureDetector(
        onTap: () {
          print("object");
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 76.0,
          width: 76.0,
          decoration: BoxDecoration(
            color: Color(value['color']),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            Icons.picture_as_pdf,
            size: 30.0,
          ),
        ),
      );
    });

    return data.toList();
  }

  Widget _buildTitleWidget(String title, Function callback,
      {bool isList = false}) {
    return Container(
      //margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
      alignment: Alignment.centerLeft,
      child: ListTile(
        leading: Text(
          title,
          //textAlign: TextAlign.left,
          style: TextStyle(
              color: Color(0xFF555067),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        trailing: isList
            ? null
            : InkWell(
                onTap: () {
                  callback();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFF6F8FF),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.more_vert,
                    color: Color(0xFF555067),
                  ),
                ),
              ),
      ),
    );
  }

  List<Widget> _buildRecentListWidget() {
    List<Widget> list = <Widget>[];
    recentList.asMap().forEach((key, value) {
      list.add(GestureDetector(
        onTap: () {
          setState(() {
            currIndex = key;
          });
        },
        onLongPress: () {
          setState(() {
            currIndex = key;
          });
        },
        child: Container(
          decoration: currIndex == key
              ? BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF8355FF), Color(0xFFB642FF)],
                      stops: [.0, .6]),
                  borderRadius: BorderRadius.circular(12.0),
                )
              : null,
          width: double.infinity,
          child: ListTile(
            dense: false,
            leading: Icon(
              Icons.no_accounts,
              size: 50,
            ),
            title: Text(
              value['file_name'],
              style: TextStyle(
                color: currIndex == key ? Colors.white : null,
              ),
            ),
            subtitle: Text(
              value['size'],
              style: TextStyle(
                color: currIndex == key ? Colors.white70 : null,
              ),
            ),
            trailing: Text(
              value['ctime'],
              style: TextStyle(
                fontSize: 10.0,
                color: currIndex == key ? Colors.white70 : null,
              ),
            ),
          ),
        ),
      ));
    });

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("文件管理器"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Directory? dir;
          if (Platform.isAndroid) {
            dir = await getExternalStorageDirectory();
          }
          Navigator.pushNamed(context, '/selectUploadFile',
              arguments: {'directory': dir!.path});
        },
        child: Icon(
          Icons.upload_sharp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.upload_outlined,
              ),
            ),
            Icon(
              Icons.timer,
            ),
            SizedBox(width: 30),
            Icon(
              Icons.timer,
            ),
            Icon(
              Icons.timer,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF7FAFF),
      body: ListView(
        //primary: false,
        children: [
          //isList: true 不显示右边下拉菜单,默认显示
          _buildTitleWidget("最近访问", () {}, isList: true),
          Container(
            height: 370,
            child: FileSelectIconWidget(),
          ),
          Divider(),
          _buildTitleWidget("磁盘空间", () {
            // JageFileManager fileManager = JageFileManager();
            // fileManager.getLocalFile();
            print("123");
          }),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildSpaceDataWidget("磁盘大小", 12)),
                Expanded(child: _buildSpaceDataWidget("已使用", 12)),
                Expanded(child: _buildSpaceDataWidget("剩余空间", 12)),
              ],
            ),
          ),
          Container(
            height: 300.0,
            width: double.infinity,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (PieTouchResponse pieTouchResponse) {
                    setState(() {
                      if (pieTouchResponse.touchedSection == null) {
                        _touchIndex = -1;
                        return;
                      }
                      _touchIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                //扇形之间的间隙
                sectionsSpace: 2.0,
                centerSpaceRadius: 40.0,
                sections: _getPieChartData(),
              ),
              swapAnimationDuration: Duration(milliseconds: 200),
              swapAnimationCurve: Curves.easeInOutQuint,
            ),
          ),
          _buildTitleWidget("其他目录", () {
            print("123");
          }),
          Container(
            height: 76.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _getOtherDirctoryWidget(),
            ),
          ),
          _buildTitleWidget("最近浏览", () {
            print("123");
          }),
          Container(
            //height: 700.0,
            child: ListView(
              shrinkWrap: true, //内容有多少，listview就有多高
              primary: false,
              scrollDirection: Axis.vertical,
              children: _buildRecentListWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
