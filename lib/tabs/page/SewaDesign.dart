import 'package:flutter/material.dart';
import '../../widget/MyPageViewWidget.dart';

class SewaDesignPage extends StatefulWidget {
  SewaDesignPage({Key? key}) : super(key: key);

  @override
  _SewaDesignPageState createState() => _SewaDesignPageState();
}

class _SewaDesignPageState extends State<SewaDesignPage> {
  static const List<String> imagesName = [
    'images/sewa/beginning.png',
    'images/sewa/last.png',
    'images/sewa/mid.png',
  ];
  final List<Widget> images =
      imagesName.map((file) => Image.asset(file, fit: BoxFit.contain)).toList();

  @override
  void initState() {
    super.initState();
  }

  Widget _pageBuilder(BuildContext context, int index) {
    return Theme.of(context).brightness == Brightness.dark ? images[index % images.length] : images[index % images.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Welcome to my Jage App!",
              // , style: TextStyle(
              //   color: Color.fromRGBO(46, 204, 113, 1)
              // ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            //Spacer(),
            Text(
              "你可以在我的APP上发表你的想法。",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              //constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
              //decoration: BoxDecoration(border: BoxBorder()),
              child: MyPageViewWidget(itemBuilder: _pageBuilder),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/design");
                });
              },
              child: Text("Get Started"),
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
