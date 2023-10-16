import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LineChartSample5 extends StatefulWidget {
  LineChartSample5({Key? key}) : super(key: key);

  @override
  _LineChartSample5State createState() => _LineChartSample5State();
}

class _LineChartSample5State extends State<LineChartSample5> {
  late int _touchIndex = -1;

  @override
  Widget build(BuildContext context) {
    // 曲线面积区域渐变颜色
    List<Color> gradientColors = [
     const  Color(0xFF12C2E9),
     const  Color(0xFFC96DDD),
     const  Color(0xFFF64F59)
    ];

    List<int> showingTooltipOnSpots = [1, 3, 5];
    final lineBarsData = [
      LineChartBarData(
        // 显示坐标点指示器
        showingIndicators: showingTooltipOnSpots,
        // 采样点
        spots: const [
          FlSpot(0, 1),
          FlSpot(1, 2),
          FlSpot(2, 1.5),
          FlSpot(3, 3),
          FlSpot(4, 3.5),
          FlSpot(5, 5),
          FlSpot(6, 8),
        ],
        // 是否是曲线
        isCurved: true,
        // 线条阴影
        shadow: const Shadow(
          blurRadius: 8,
        ),
        gradient: LinearGradient(colors: gradientColors),
        // 线条宽度
        barWidth: 5,
        // 线条是否是圆形
        isStrokeCapRound: true,
        // 数据点
        dotData: FlDotData(
          // 是否显示
          show: false,
          // getDotPainter: (spot, percent, barData, index) {
          //   return FlDotCirclePainter(
          //     color: lerpGradient(
          //       barData.gradient!.colors,
          //       barData.gradient!.stops!,
          //       percent / 100,
          //     ),
          //     strokeWidth: 3,
          //     strokeColor: Colors.black87,
          //     radius: 10,
          //   );

          // },
        ),
        // 是否显示线上的面积区域
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            // 面积区域颜色与线条的颜色保持一致
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            stops: const [0.1, 0.4, 0.9],
          ),
        ),
      ),
    ];
    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
      //floatingActionButton: Draggable,
      appBar: AppBar(
        title: Text("flchart"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                // color: Color(0xff232d37),
              ),
              child: AspectRatio(
                aspectRatio: 2.5,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return LineChart(
                      LineChartData(
                        showingTooltipIndicators:
                            showingTooltipOnSpots.map((index) {
                          return ShowingTooltipIndicators([
                            LineBarSpot(
                              tooltipsOnBar,
                              lineBarsData.indexOf(tooltipsOnBar),
                              tooltipsOnBar.spots[index],
                            ),
                          ]);
                        }).toList(),
                        backgroundColor: Color.fromARGB(255, 53, 48, 48),
                        // 网格数据
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
                          horizontalInterval: 1,
                          verticalInterval: 1,
                          getDrawingHorizontalLine: (double value) {
                            return FlLine(
                              color: Colors.white10,
                              strokeWidth: 1,
                            );
                          },
                          getDrawingVerticalLine: (double value) {
                            return FlLine(
                              color: Colors.white10,
                              strokeWidth: 1,
                            );
                          },
                        ),
                        // 标题配置
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.amber,
                                );
                                String text;
                                switch (value.toInt()) {
                                  case 0:
                                    text = '00:00';
                                    break;
                                  case 1:
                                    text = '04:00';
                                    break;
                                  case 2:
                                    text = '08:00';
                                    break;
                                  case 3:
                                    text = '12:00';
                                    break;
                                  case 4:
                                    text = '16:00';
                                    break;
                                  case 5:
                                    text = '20:00';
                                    break;
                                  case 6:
                                    text = '23:59';
                                    break;
                                  default:
                                    return Container();
                                }
                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(text, style: style),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            axisNameSize: 24.0,
                            axisNameWidget: Text(
                              "抽数",
                              style: TextStyle(
                                color: Color.fromARGB(255, 10, 10, 10),
                              ),
                            ),
                            sideTitles: SideTitles(
                              showTitles: false,
                              reservedSize: 0,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                );
                                String text;
                                switch (value.toInt()) {
                                  case 1:
                                    text = '10K';
                                    break;
                                  case 3:
                                    text = '30k';
                                    break;
                                  case 5:
                                    text = '50k';
                                    break;
                                  default:
                                    return Container();
                                }
                                return Text(text,
                                    style: style, textAlign: TextAlign.left);
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(
                            color: const Color(0xff37434d),
                          ),
                        ),
                        minX: 0,
                        lineBarsData: lineBarsData,
                        // 触摸事件
                        lineTouchData: LineTouchData(
                          enabled: true,
                          handleBuiltInTouches: false,
                          touchCallback: (FlTouchEvent event,
                              LineTouchResponse? response) {
                            // if (response == null ||
                            //     response.lineBarSpots == null) {
                            //   return;
                            // }
                            // if (event is FlTapUpEvent) {
                            //   final spotIndex =
                            //       response.lineBarSpots?.first.spotIndex;
                            //   setState(() {
                            //     if (showingTooltipOnSpots.contains(spotIndex)) {
                            //       showingTooltipOnSpots.remove(spotIndex);
                            //     } else {
                            //       showingTooltipOnSpots.add(spotIndex!);
                            //     }
                            //   });
                            // }
                          },
                          mouseCursorResolver: (FlTouchEvent event,
                              LineTouchResponse? response) {
                            if (response == null ||
                                response.lineBarSpots == null) {
                              return SystemMouseCursors.basic;
                            }
                            return SystemMouseCursors.click;
                          },
                          getTouchedSpotIndicator: (LineChartBarData barData,
                              List<int> spotIndexes) {
                            return spotIndexes.map((index) {
                              return TouchedSpotIndicatorData(
                                FlLine(
                                  color: Colors.pink,
                                ),
                                FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                          FlDotCirclePainter(
                                    radius: 8,
                                    // color: lerpGradient(
                                    //   barData.gradient!.colors,
                                    //   barData.gradient!.stops!,
                                    //   percent / 100,
                                    // ),
                                    color:  Colors.amber,
                                    strokeWidth: 2,
                                    strokeColor: Colors.amber,
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.pink,
                            tooltipRoundedRadius: 8,
                            getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                              return lineBarsSpot.map((lineBarSpot) {
                                return LineTooltipItem(
                                  lineBarSpot.y.toString(),
                                  const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: TextButton(
                child: Text("avg"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (colors.isEmpty) {
    throw ArgumentError('"colors" is empty.');
  } else if (colors.length == 1) {
    return colors[0];
  }

  if (stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / (colors.length - 1);
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s];
    final rightStop = stops[s + 1];
    final leftColor = colors[s];
    final rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT)!;
    }
  }
  return colors.last;
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}
