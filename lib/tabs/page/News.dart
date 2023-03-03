import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  void demo() async {
    var tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print(tempPath);
    print(appDocPath);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key("wq"),
      //controller: slidableController,
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: null,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          
        ],
      ), // 侧滑菜单出现方式 SlidableScrollActionPane SlidableDrawerActionPane SlidableStrechActionPane
      //actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
      enabled: true, // 是否启用侧滑 默认启用
      // dismissal: SlidableDismissal(
      //   child: SlidableDrawerDismissal(),
      //   onDismissed: (actionType) {
      //   },
      //   //onWillDismiss: (actionType) {},
      // ),
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('11'),
            foregroundColor: Colors.white,
          ),
          title: Text('Tile n°11'),
          subtitle: Text('SlidableDrawerDelegate'),
        ),
      ),
    );
    ;
  }
}
