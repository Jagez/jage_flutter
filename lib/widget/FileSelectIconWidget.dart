import 'package:flutter/material.dart';
import '../res/ListImages.dart';

class FileSelectIconWidget extends StatefulWidget {
  FileSelectIconWidget({Key? key}) : super(key: key);

  @override
  State<FileSelectIconWidget> createState() => _FileSelectIconWidgetState();
}

class _FileSelectIconWidgetState extends State<FileSelectIconWidget> {
  @override
  Widget build(BuildContext context) {
    return buildGridView(context);
  }

  List<Widget> _getInfo() {
    var data = listImage.map((value) {
      return Container(
        height: double.infinity,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(
            //边框的颜色
            color: Color.fromRGBO(233, 233, 233, 0.7),
          ),
        ),
        child: Column(
          children: [
            Container(
              //width: 512.0,
              child: AspectRatio(
                aspectRatio: 2.0 / 1.7,
                child: Container(
                  color: Colors.yellow,
                  child: Image.asset(
                    value['uri'],
                    //fit: BoxFit.fitWidth,

                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Text(
              value['title'],
              maxLines: 2,
              style: TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    });
    return data.toList();
  }

  List<Widget> _getFileTypeIcons() {
    var data = fileTypeList.map((value) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: Colors.white),
          color: Color(value["color"]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(value["icon"]),
            Container(
              height: 60.0,
              constraints: const BoxConstraints(
                minHeight: 60.0,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.6, -0.6),
                    child: Text(
                      value["file_type"],
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.6, 0.6),
                    child: Text(
                      value["files"] + "Files",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.6, 0.6),
                    child: Text(
                      value["size"] + "MB",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
    return data.toList();
  }

  Widget buildGridView(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(15.0),
      crossAxisSpacing: 15.0, //水平间距
      mainAxisSpacing: 15.0, //垂直间距
      crossAxisCount: 2,
      childAspectRatio: 1.5, //宽/高比例
      children: this._getFileTypeIcons(),
    );
  }
}