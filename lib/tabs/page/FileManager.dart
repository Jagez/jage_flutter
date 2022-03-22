import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jage_app/widget/FileSelectIconWidget.dart';

class FileManager extends StatefulWidget {
  FileManager({Key? key}) : super(key: key);

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {

  int _touchIndex = -1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件管理器"),
      ),
      backgroundColor: Color(0xFFF7FAFF),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "快速访问",
                //textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFF555067),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: FileSelectIconWidget(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 200.0,
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
                  sectionsSpace: 2.0,
                  centerSpaceRadius: 40.0,
                  sections: _getPieChartData(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
