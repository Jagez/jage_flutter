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

  PyramidSeries<ChartSampleData, String> _getPyramidSeriesData() {
    return PyramidSeries<ChartSampleData, String> (
      dataSource: <ChartSampleData>[
        ChartSampleData("walnuts", 222),
        ChartSampleData("almonds", 575),
        ChartSampleData("soybeans", 446),
      ],
      height: '90%',
      pyramidMode: PyramidMode.linear,
      xValueMapper: (ChartSampleData data, _) => data.x,
      yValueMapper: (ChartSampleData data, _) => data.y,
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
      )
    );
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
    _SparkBarData(DateTime(2012,10,5), 3),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: "test SfCartesianChart"),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <LineSeries<_PieData, String>>[
                    LineSeries(
                      dataSource: <_PieData>[
                        _PieData("jan", 35),
                        _PieData("Feb", 28),
                        _PieData("apr", 32),
                        _PieData("may", 40),
                      ], 
                      xValueMapper: (_PieData pieData, _) => pieData.xData, 
                      yValueMapper: (_PieData pieData, _) => pieData.yData,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ]
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
                  width: double.infinity,
                  height: 500,
                  child: SfSparkLineChart(
                    //axisLineDashArray: [10, 10, 10, 10, 10],
                    data: <double>[
                      1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
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
                      1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3
                    ],
                  ),
                ),
                SfPyramidChart(
                  smartLabelMode: SmartLabelMode.shift,
                  title: ChartTitle(text: "SfPyramidChart test"),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getPyramidSeriesData(),
                ),
                SfFunnelChart(
                  smartLabelMode: SmartLabelMode.shift,
                  title: ChartTitle(text: "SfFunnelChart test"),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getFunnelSeriesData(),
                ),
                // SfSparkAreaChart(
                  
                // ),
                SfSparkBarChart(
                  data: const <double>[
                    10, 3, -4, 5.8, 3.4, 9.0, -2, 1.8, 4.9, -3,
                  ],
                  highPointColor: const Color.fromRGBO(29, 30, 122, 1),
                  trackball: const SparkChartTrackball(
                    activationMode:SparkChartActivationMode.tap
                  ),
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
                    activationMode: SparkChartActivationMode.tap
                  ),
                ),
                SfCartesianChart(
                  series: <ColumnSeries<_ColumnData, String>>[
                    ColumnSeries(
                      dataSource: _chartColumnSeriesData, 
                      xValueMapper: (_ColumnData data, _) => data.x as String, 
                      yValueMapper: (_ColumnData data, _) => data.y,
                      emptyPointSettings: EmptyPointSettings(
                        mode: EmptyPointMode.drop, color: Colors.red,
                      ),
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
                SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: 
                    NumericAxis(majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                    majorTickLines: const MajorTickLines(color: Colors.transparent),
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
