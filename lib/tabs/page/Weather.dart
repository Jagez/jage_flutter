import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  
  static const List<String> imagesName = [
    "images/weather/location.png",
    "images/weather/Line.png",
    "images/weather/Flat.png",
  ];

  final List<Widget> images = 
    imagesName.map((filename) => Image.asset(filename, fit: BoxFit.contain,)).toList();

  Widget _buildImage(BuildContext context, int index) {
    return Theme.of(context).brightness == Brightness.dark ? 
      images[index % images.length] : images[index % images.length];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //_buildImage(images),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    radius: .3,
                    colors: <Color>[
                      Colors.transparent,
                      Colors.transparent,
                      Colors.grey.withOpacity(.7),
                      Colors.grey.withOpacity(.7),
                    ],
                    stops: [0, .5, .5, 1],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Column(
                  children: [
                    _buildImage(context, 0),
                    _buildImage(context, 1),
                    _buildImage(context, 2),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "take care of your day by \n checking the weather forecast",
                  softWrap: true,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                //margin: EdgeInsets.only(left: 50.0, right: 50.0,),
                width: 260.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/weatherDetail');
                  }, 
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.red, width: 3.0),
                      borderRadius: BorderRadius.circular(100),
                    )),
                    
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //判断是否包含此状态
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.greenAccent;
                      }
                      return Color(0xFFFCC27A);
                    }),
                    // side: MaterialStateProperty.all(BorderSide(
                    //   //style: BorderStyle.solid,
                    // )),
                  ),
                  child: Text("Start Now"),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}