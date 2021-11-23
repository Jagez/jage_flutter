import 'dart:math';

import 'package:flutter/material.dart';

class DesignCardPage extends StatefulWidget {
  DesignCardPage({Key? key}) : super(key: key);

  @override
  _DesignCardPageState createState() => _DesignCardPageState();
}

class _DesignCardPageState extends State<DesignCardPage> {
  double topPos_one = 0;
  double topPos_two = 180;
  double topPos_three = 360;
  double topPos_four = 540;
  double leftPos = 140.0;
  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    final appBar = AppBar(
      title: Text("CardPage"),
    );
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: topPos_one,
              left: 1,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  setState(() {
                    topPos_one = MediaQuery.of(context).size.height -
                        (appBar.preferredSize.height + topPadding + 30);
                    //topPos *= Random().nextDouble();
                    print(MediaQuery.of(context).size);
                    leftPos = Random().nextDouble() * leftPos;
                  });
                },
                child: Image.asset("images/thumb_unit_profile_100131.png"),
              ),
            ),
            AnimatedPositioned(
              top: topPos_two,
              left: 1,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  setState(() {
                    topPos_two = MediaQuery.of(context).size.height -
                        (appBar.preferredSize.height + topPadding + 30);
                    //topPos *= Random().nextDouble();
                    print(MediaQuery.of(context).size);
                    leftPos = Random().nextDouble() * leftPos;
                  });
                },
                child: Image.asset("images/thumb_unit_profile_100131.png"),
              ),
            ),
            AnimatedPositioned(
              top: topPos_three,
              left: 1,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  setState(() {
                    topPos_three = MediaQuery.of(context).size.height -
                        (appBar.preferredSize.height + topPadding + 30);
                    topPos_three *= 0.25;
                    //topPos *= Random().nextDouble();
                    print(MediaQuery.of(context).size);
                    leftPos = Random().nextDouble() * leftPos;
                  });
                },
                child: Image.asset("images/thumb_unit_profile_100211.png"),
              ),
            ),
            AnimatedPositioned(
              top: topPos_four,
              left: 1,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: () {
                  setState(() {
                    topPos_four = MediaQuery.of(context).size.height -
                        (appBar.preferredSize.height + topPadding + 30);
                        topPos_four *= 0.5;
                    //topPos *= Random().nextDouble();
                    print(MediaQuery.of(context).size);
                    leftPos = Random().nextDouble() * leftPos;
                  });
                },
                child: Image.asset("images/thumb_unit_profile_100231.png"),
              ),
            ),
            // Align(
            //   alignment: Alignment(0, 0.5),
            //   child: Image.asset("images/thumb_unit_profile_100131.png"),
            // ),
          ],
        ),
      ),
    );
  }
}
