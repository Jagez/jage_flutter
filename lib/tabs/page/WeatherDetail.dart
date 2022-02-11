import 'package:flutter/material.dart';

class WeatherDetailPage extends StatefulWidget {
  WeatherDetailPage({Key? key}) : super(key: key);

  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {


  static final  List<Color> _sBottomColor = <Color>[
    Color(0xFFECEEF5),
    Color(0xFF9C96C6),
  ];
  static final List<Color> _sTopColor = <Color>[
    Color(0xFF69B3D3),
    Color(0xFF292277),
  ];
  final List<double> _gradientStops = <double>[
    .1,
    .9,
  ];

  String _sityName = "城市";
  String _weather = "晴";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).brightness != Brightness.dark ? 
              _sTopColor[0] : _sTopColor[1],
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Image.asset('images/weather/Search.png'),
          ),
        ],
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset("images/weather/Category.png"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).brightness != Brightness.dark ? 
              [_sBottomColor[0], _sTopColor[0]] : [_sBottomColor[1], _sTopColor[1]],
            begin: Alignment.bottomCenter,
            //必须和colors长度一致
            stops: _gradientStops,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  // Widget _buildWeatherIcon() {
  //   return null;
  // }
}