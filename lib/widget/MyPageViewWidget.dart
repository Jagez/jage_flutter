import 'package:flutter/material.dart';

class MyPageViewWidget extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  const MyPageViewWidget({Key? key, required this.itemBuilder})
      : super(key: key);

  @override
  _MyPageViewWidgetState createState() => _MyPageViewWidgetState();
}

class _MyPageViewWidgetState extends State<MyPageViewWidget> {
  late final PageController _pageController;
  late int _currentPage;
  bool _pageIsChanged = false;

  @override
  void initState() {
    super.initState();

    _currentPage = 0;
    _pageController = PageController(
      viewportFraction: .85,
      initialPage: _currentPage,
    );
  }
  // Widget _getHomeMidImage() {
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          _currentPage = value;
        });
      },
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          var result =
              _pageIsChanged ? _pageController.page! : _currentPage * 1.0;

          var value = result - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) *
                  MediaQuery.of(context).size.height,
              width: Curves.easeOut.transform(value) *
                  MediaQuery.of(context).size.width,
              child: child,
            ),
          );
        },
        child: widget.itemBuilder(context, index),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
