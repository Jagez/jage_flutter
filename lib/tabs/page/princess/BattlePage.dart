import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BattlePage extends StatefulWidget {
  BattlePage({Key? key}) : super(key: key);

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  final List<int> _star = <int>[1, 2, 3, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("会战分刀"),
            floating: true,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: AspectRatio(
                aspectRatio: 1 / 1.77,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  fit: BoxFit.fill,
                  image: "http://jage.cktyun.com/1.png",
                ),
              ),
            ),
            pinned: true,
          ),
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: _buildRow(index),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(int index) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        _buildIconItem("images/unit/icon_unit_002112.png", 10),
        _buildIconItem("images/unit/icon_unit_002112.png", 111),
        Spacer(),
      ],
    );
  }

  Widget _buildStar(bool isLess) {
    if (isLess) {
      return Container(
        height: 9.0,
        width: 9.0,
        child: Image.asset("assets/icon/29.png"),
      );
    } else {
      return Container(
        height: 9.0,
        width: 9.0,
        child: Image.asset("assets/icon/26.png"),
      );
    }
  }

  Widget _buildIconItem(String icon, int level) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 54, //64
        width: 54,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(icon),
        )),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Image.asset("assets/icon/336.png"),
            ),
            Align(
              alignment: Alignment(0.0, -1.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/377.png",
                    height: 12,
                    width: 13,
                  ),
                  Text(
                    level.toString(),
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(-1.0, 1.0),
              child: Row(
                children: [
                  _buildStar(false),
                  _buildStar(false),
                  _buildStar(false),
                  _buildStar(true),
                  _buildStar(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
