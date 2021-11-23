import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';



class QrPage extends StatefulWidget {
  QrPage({Key? key}) : super(key: key);

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QrPage"),
      ),
      body: Container(
        child: QrImage(
          data: "ΣHello, Jage！",
          version: QrVersions.auto,
          size: 300,
          gapless: false,
          //embeddedImage: AssetImage('assets/icon/a10.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(80, 80),
          ),
        ),
      ),
    );
  }
}