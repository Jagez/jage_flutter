import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  LottiePage({Key? key}) : super(key: key);

  @override
  _LottiePageState createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Page"),
      ),
      body: ListView(
        children: [
          //新增文件要在终端退出，重新安装app：flutter run
          //Lottie.asset('assets/lottie/bullseye.json'),
        ],
      ),
    );
  }
}