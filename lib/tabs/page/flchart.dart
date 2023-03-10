import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartPage extends StatefulWidget {
  ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class ChartSampleData {
  final String x;
  final num y;

  ChartSampleData(this.x, this.y);
}

class ChartFunelData {
  final String x;
  final num y;
  ChartFunelData(this.x, this.y);
}

class _SparkBarData {
  final dynamic x;
  final num y;
  _SparkBarData(this.x, this.y);
}

class _ColumnData {
  final dynamic x;
  final num? y;
  _ColumnData(this.x, this.y);
}

class _StepLineData {
  final num xData;
  final num yData;
  _StepLineData(this.xData, this.yData);
}

class _ChartPageState extends State<ChartPage> {
  late int _touchIndex = -1;

  PyramidSeries<ChartSampleData, String> _getPyramidSeriesData() {
    return PyramidSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData("walnuts", 222),
          ChartSampleData("almonds", 575),
          ChartSampleData("soybeans", 446),
        ],
        height: '90%',
        pyramidMode: PyramidMode.linear,
        explode: true,
        explodeOffset: '10%',
        explodeIndex: 2,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
        ));
  }

  FunnelSeries<ChartFunelData, String> _getFunnelSeriesData() {
    return FunnelSeries<ChartFunelData, String>(
      dataSource: <ChartFunelData>[
        ChartFunelData("purchased", 159),
        ChartFunelData("reuestd prisce", 300),
        ChartFunelData("visit download", 3600),
        ChartFunelData("watched demo", 4000),
      ],
      xValueMapper: (ChartFunelData data, _) => data.x,
      yValueMapper: (ChartFunelData data, _) => data.y,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
    );
  }

  final List<_SparkBarData> _chartSparkBarData = <_SparkBarData>[
    _SparkBarData(DateTime(2012, 10, 5), 3),
    _SparkBarData(DateTime(2013, 12, 19), 46),
    _SparkBarData(DateTime(2014, 10, 28), 90),
    _SparkBarData(DateTime(2015, 5, 25), 43),
    _SparkBarData(DateTime(2016, 3, 15), 123),
    _SparkBarData(DateTime(2017, 8, 4), 55),
    _SparkBarData(DateTime(2018, 12, 15), 78),
    _SparkBarData(DateTime(2018, 1, 27), 13),
    _SparkBarData(DateTime(2019, 12, 8), 51),
    _SparkBarData(DateTime(2020, 9, 22), 100),
    _SparkBarData(DateTime(2021, 2, 19), 31),
  ];

  final List<List<double>> _winlossData = <List<double>>[
    <double>[0, 6, -4, 1, -3, 2, 5],
    <double>[5, -4, 6, 3, -1, 2, 0],
    <double>[6, 4, 0, 3, -2, 5, 1],
    <double>[4, -6, 3, 0, 1, -2, 5],
    <double>[3, 5, -6, -4, 0, 1, 2],
    <double>[1, -3, 4, -2, 5, 0, 6],
    <double>[2, 4, 0, -3, 5, -6, 1],
    <double>[5, 4, -6, 3, 1, -2, 0],
    <double>[0, -6, 4, 1, -3, 2, 5],
    <double>[6, 4, 0, -3, 2, -5, 1],
    <double>[4, 6, -3, 0, 1, 2, 5],
    <double>[3, -5, -6, 4, 0, 1, 2],
    <double>[1, 3, -4, -2, 5, 0, 6],
    <double>[2, -4, 0, -3, 5, 6, 1],
    <double>[5, 4, -6, 3, 1, -2, 0],
    <double>[0, 6, 4, -1, -3, 2, 5],
    <double>[6, -4, 0, -3, 2, 5, 1],
    <double>[4, 6, -3, 0, -1, 2, 5],
    <double>[6, 4, 0, -3, 2, -5, 1],
    <double>[3, 5, 6, -4, 0, 1, 2],
    <double>[1, 3, -4, 2, -5, 0, 6]
  ];

  final List<_ColumnData> _chartColumnSeriesData = <_ColumnData>[
    _ColumnData("fffa", 323),
    _ColumnData("asdas", 177),
    _ColumnData("bob", 444),
    _ColumnData("gog", 231),
    _ColumnData("ben", 199),
    _ColumnData("jhon", 366),
    _ColumnData("dk", 200),
  ];

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
      //floatingActionButton: Draggable,
      appBar: AppBar(
        title: Text("flchart"),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SfCartesianChart(
                    onMarkerRender: (MarkerRenderArgs markerargs) {
                      if (markerargs.pointIndex == 2) {
                        markerargs.markerHeight = 10.0;
                        markerargs.markerWidth = 10.0;
                        markerargs.shape = DataMarkerType.circle;
                        markerargs.color = Colors.blueAccent;
                      } else {
                        markerargs.markerHeight = 10.0;
                        markerargs.markerWidth = 10.0;
                        markerargs.shape = DataMarkerType.circle;
                      }

                      //print(markerargs.toString());
                    },
                    onLegendTapped: (LegendTapArgs legendTapArgs) {
                      print(legendTapArgs.toString());
                    },
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      minimum: 0.0,
                      maximum: 300.0,
                    ),
                    title: ChartTitle(text: "公主连接抽卡记录"),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <LineSeries<_PieData, String>>[
                      LineSeries(
                        name: "免费单发",
                        dataSource: <_PieData>[
                          _PieData("凯露（夏日）", 0),
                          _PieData("珠希（夏日）", 141),
                          _PieData("环奈", 2),
                          _PieData("忍（万圣节）", 1),
                          _PieData("克里斯提娜", 3),
                          _PieData("环奈（振袖）", 0),
                          _PieData("雷姆", 2),
                          _PieData("复刻：凯露（夏日）·佩可莉姆（夏日）", 3),
                          _PieData("真琴（夏日）", 7),
                          _PieData("复刻：玲莓（夏日）·珠希（夏日）", 3),
                          _PieData("真步（夏日）", 120),
                          _PieData("似似花", 16),
                          _PieData("镜华（万圣节）", 4),
                          _PieData("露娜", 4),
                          _PieData("复刻：千歌（圣诞节）·绫音（圣诞节）", 0),
                          _PieData("伊莉雅（圣诞节）", 10),
                          _PieData("凯露（新年）", 20),
                          _PieData("复刻：日和莉（新年）·优依（新年）", 20),
                          _PieData("可可萝（新年）", 3),
                          _PieData("佩可莉姆（公主）", 44),
                          _PieData("复刻：静流（情人节）", 40),
                            _PieData("可可萝（公主）", 0),
                            _PieData("优衣（公主）", 1),
                            _PieData("流夏（夏日）", 1),
                            _PieData("拉比林斯达（FES）", 11),
                            _PieData("纯（夏日）", 100),
                            _PieData("复刻：雷姆·EMT", 70),
                            _PieData("咲恋（圣诞节）", 100),  
                            _PieData("日和莉（公主）", 30),
                            _PieData("佩可莉姆（新年）", 10),
                            _PieData("似似花（新年）", 0),
                            _PieData("雪菲", 80),
                            _PieData("霞（夏日）·弃", 50),
                            _PieData("凯露（公主）·弃", 10),
                            _PieData("复刻：卯月·凛", 0), 
                        ],
                        xValueMapper: (_PieData pieData, _) => pieData.xData,
                        yValueMapper: (_PieData pieData, _) => pieData.yData,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          borderColor: Colors.red,
                        ),
                      ),
                      LineSeries(
                        name: "免费钻石",
                        dataSource: <_PieData>[
                          _PieData("凯露（夏日）", 300),
                          _PieData("珠希（夏日）", 0),
                          _PieData("环奈", 20),
                          _PieData("忍（万圣节）", 110),
                          _PieData("克里斯提娜", 0),
                          _PieData("环奈（振袖）", 300),
                          _PieData("雷姆", 0),
                          _PieData("复刻：凯露（夏日）·佩可莉姆（夏日）", 80),
                          _PieData("真琴（夏日）", 30),
                          _PieData("复刻：玲莓（夏日）·珠希（夏日）", 190),
                          _PieData("真步（夏日）", 0),
                          _PieData("似似花", 0),
                          _PieData("镜华（万圣节）", 296),
                          _PieData("露娜", 2),
                          _PieData("复刻：千歌（圣诞节）·绫音（圣诞节）", 300),
                          _PieData("伊莉雅（圣诞节）", 0),
                          _PieData("凯露（新年）", 20),
                          _PieData("复刻：日和莉（新年）·优依（新年）", 20),
                          _PieData("可可萝（新年）", 60),
                          _PieData("佩可莉姆（公主）", 0),
                          _PieData("复刻：静流（情人节）", 50),
                            _PieData("可可萝（公主）", 40),
                            _PieData("优衣（公主）", 32),
                            _PieData("流夏（夏日）", 21),
                            _PieData("拉比林斯达（FES）", 110),
                            _PieData("纯（夏日）", 0),
                            _PieData("复刻：雷姆·EMT", 200),
                            _PieData("咲恋（圣诞节）", 0),  
                            _PieData("日和莉（公主）", 150),
                            _PieData("佩可莉姆（新年）", 178),
                            _PieData("似似花（新年）", 134),
                            _PieData("雪菲", 0),
                            _PieData("霞（夏日）·弃", 0),
                            _PieData("凯露（公主）·弃", 10),
                            _PieData("复刻：卯月·凛", 299), 
                        ],
                        xValueMapper: (_PieData pieData, _) => pieData.xData,
                        yValueMapper: (_PieData pieData, _) => pieData.yData,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        markerSettings: MarkerSettings(isVisible: true),
                      ),
                    ]),
                Container(
                  height: 1200.0,
                  width: double.infinity,
                  child: SfCartesianChart(
                      // onMarkerRender: (MarkerRenderArgs markerargs) {
                      //   if (markerargs.pointIndex == 2) {
                      //     markerargs.markerHeight = 10.0;
                      //     markerargs.markerWidth = 10.0;
                      //     markerargs.shape = DataMarkerType.circle;
                      //     markerargs.color = Colors.blueAccent;
                      //   } else {
                      //     markerargs.markerHeight = 10.0;
                      //     markerargs.markerWidth = 10.0;
                      //     markerargs.shape = DataMarkerType.circle;
                      //   }

                      //   //print(markerargs.toString());
                      // },
                      // onLegendTapped: (LegendTapArgs legendTapArgs) {
                      //   print(legendTapArgs.toString());
                      // },
                      primaryXAxis: CategoryAxis(),
                      primaryYAxis: NumericAxis(
                        minimum: 0.0,
                        maximum: 300.0,
                        interval: 50.0,
                      ),
                      title: ChartTitle(text: "公主连接抽卡记录"),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <BarSeries<_PieData, String>>[
                        BarSeries(
                          name: "免费单发",
                          color: Color.fromRGBO(8, 142, 255, 1),
                          dataSource: <_PieData>[
                            _PieData("凯露（夏日）·弃", 0),
                            _PieData("珠希（夏日）·弃", 141),
                            _PieData("环奈·弃", 2),
                            _PieData("忍（万圣节）", 1),
                            _PieData("克里斯提娜·弃", 3),
                            _PieData("矛依未", 110),
                            _PieData("环奈（振袖）·环奈", 0),
                            _PieData("雷姆", 2),
                            _PieData("水黑·水吃", 3),
                            _PieData("真琴（夏日）", 7),
                            _PieData("水女仆·水猫剑·女仆弃", 3),
                            _PieData("真步（夏日）·弃", 120),
                            _PieData("似似花", 16),
                            _PieData("镜华（万圣节）", 4),
                            _PieData("露娜", 4),
                            _PieData("复刻：圣千歌·圣锤", 0),
                            _PieData("伊莉雅（圣诞节）", 10),
                            _PieData("凯露（新年）", 20),
                            _PieData("春猫·春田", 6),
                            _PieData("可可萝（新年）", 3),
                            _PieData("佩可莉姆（公主）", 44),
                            _PieData("复刻：静流（情人节）", 40),
                            _PieData("可可萝（公主）", 0),
                            _PieData("优衣（公主）", 1),
                            _PieData("流夏（夏日）", 1),
                            _PieData("拉比林斯达（FES）", 11),
                            _PieData("纯（夏日）·弃", 100),
                            _PieData("复刻：雷姆·EMT", 70),
                            _PieData("咲恋（圣诞节）", 100),  
                            _PieData("日和莉（公主）", 30),
                            _PieData("佩可莉姆（新年）", 10),
                            _PieData("似似花（新年）", 0),
                            _PieData("雪菲", 80),
                            _PieData("霞（夏日）·弃", 50),
                            _PieData("凯露（公主）·弃", 12),
                            _PieData("复刻：卯月·凛", 1), 
                          ],
                          xValueMapper: (_PieData pieData, _) => pieData.xData,
                          yValueMapper: (_PieData pieData, _) => pieData.yData,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        BarSeries(
                          name: "免费钻石",
                          dataSource: <_PieData>[
                            _PieData("凯露（夏日）·弃", 300),
                            _PieData("珠希（夏日）·弃", 0),
                            _PieData("环奈·弃", 20),
                            _PieData("忍（万圣节）", 110),
                            _PieData("克里斯提娜·弃", 0),
                            _PieData("矛依未", 0),
                            _PieData("环奈（振袖）·环奈", 300),
                            _PieData("雷姆", 0),
                            _PieData("水黑·水吃", 80),
                            _PieData("真琴（夏日）", 30),
                            _PieData("水女仆·水猫剑·女仆弃", 190),
                            _PieData("真步（夏日）·弃", 0),
                            _PieData("似似花", 0),
                            _PieData("镜华（万圣节）", 296),
                            _PieData("露娜", 2),
                            _PieData("复刻：圣千歌·圣锤", 300),
                            _PieData("伊莉雅（圣诞节）", 0),
                            _PieData("凯露（新年）", 20),
                            _PieData("春猫·春田", 294),
                            _PieData("可可萝（新年）", 60),
                            _PieData("佩可莉姆（公主）", 0),
                            _PieData("复刻：静流（情人节）", 50),
                            _PieData("可可萝（公主）", 40),
                            _PieData("优衣（公主）", 32),
                            _PieData("流夏（夏日）", 21),
                            _PieData("拉比林斯达（FES）", 110),
                            _PieData("纯（夏日）·弃", 0),
                            _PieData("复刻：雷姆·EMT", 200),
                            _PieData("咲恋（圣诞节）", 0),  
                            _PieData("日和莉（公主）", 150),
                            _PieData("佩可莉姆（新年）", 178),
                            _PieData("似似花（新年）", 134),
                            _PieData("雪菲", 0),
                            _PieData("霞（夏日）·弃", 0),
                            _PieData("凯露（公主）·弃", 0),
                            _PieData("复刻：卯月·凛", 299), 
                          ],
                          xValueMapper: (_PieData pieData, _) => pieData.xData,
                          yValueMapper: (_PieData pieData, _) => pieData.yData,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          //markerSettings: MarkerSettings(isVisible: true),
                        ),
                      ]),
                ),

                Container(
                  height: 250.0,
                  width: double.infinity,
                  child: SfCircularChart(
                    title: ChartTitle(text: "test SfCircularChart"),
                    legend: Legend(isVisible: true),
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                        explode: true,
                        explodeIndex: 0,
                        dataSource: <_PieData>[
                          _PieData("xData", 12, "dsd"),
                          _PieData("xData", 12, "dsd"),
                          _PieData("xData", 12, "dsd"),
                          _PieData("xData", 12, "dsd"),
                          _PieData("xData", 12, "dsd"),
                        ],
                        xValueMapper: (_PieData data, _) => data.xData,
                        yValueMapper: (_PieData data, _) => data.yData,
                        dataLabelMapper: (_PieData data, _) => data.text,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      )
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
                            _touchIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
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
                Container(
                  width: double.infinity,
                  height: 500,
                  child: SfSparkLineChart(
                    //axisLineDashArray: [10, 10, 10, 10, 10],
                    data: <double>[
                      1,
                      5,
                      -6,
                      0,
                      1,
                      -2,
                      7,
                      -7,
                      -4,
                      -10,
                      13,
                      -6,
                      7,
                      5,
                      11,
                      5,
                      3
                    ],
                  ),
                ),
                Container(
                  child: SfSparkLineChart(
                    trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap,
                    ),
                    marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all,
                    ),
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    data: <double>[
                      1,
                      5,
                      -6,
                      0,
                      1,
                      -2,
                      7,
                      -7,
                      -4,
                      -10,
                      13,
                      -6,
                      7,
                      5,
                      11,
                      5,
                      3
                    ],
                  ),
                ),
                SfPyramidChart(
                  //smartLabelMode: SmartLabelMode.shift,
                  title: ChartTitle(text: "SfPyramidChart test"),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getPyramidSeriesData(),
                ),
                SfFunnelChart(
                  //smartLabelMode: SmartLabelMode.shift,
                  title: ChartTitle(text: "SfFunnelChart test"),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getFunnelSeriesData(),
                ),
                // SfSparkAreaChart(

                // ),
                SfSparkBarChart(
                  data: const <double>[
                    10,
                    3,
                    -4,
                    5.8,
                    3.4,
                    9.0,
                    -2,
                    1.8,
                    4.9,
                    -3,
                  ],
                  highPointColor: const Color.fromRGBO(29, 30, 122, 1),
                  trackball: const SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                ),
                SfSparkBarChart.custom(
                  dataCount: 11,
                  xValueMapper: (int index) => _chartSparkBarData[index].x,
                  yValueMapper: (int index) => _chartSparkBarData[index].y,
                  trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap,
                  ),
                ),
                SfSparkWinLossChart(
                  data: _winlossData[2],
                  trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                ),
                SfCartesianChart(
                  series: <ColumnSeries<_ColumnData, String>>[
                    ColumnSeries(
                      dataSource: _chartColumnSeriesData,
                      xValueMapper: (_ColumnData data, _) => data.x as String,
                      yValueMapper: (_ColumnData data, _) => data.y as num,
                      emptyPointSettings: EmptyPointSettings(
                        mode: EmptyPointMode.drop,
                        color: Colors.red,
                      ),
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                    majorTickLines:
                        const MajorTickLines(color: Colors.transparent),
                    axisLine: const AxisLine(width: 0),
                    minimum: 0,
                    maximum: 100,
                  ),
                  series: <StepLineSeries<_StepLineData, num>>[
                    StepLineSeries(
                      dataSource: <_StepLineData>[
                        _StepLineData(2, 81),
                        _StepLineData(3, 41),
                        _StepLineData(4, 24),
                        _StepLineData(5, 55),
                        _StepLineData(6, 22),
                        _StepLineData(7, 19),
                      ],
                      xValueMapper: (_StepLineData data, _) => data.xData,
                      yValueMapper: (_StepLineData data, _) => data.yData,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}
