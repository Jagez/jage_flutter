import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  void demo()async{
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
      actionPane:
          SlidableScrollActionPane(), // 侧滑菜单出现方式 SlidableScrollActionPane SlidableDrawerActionPane SlidableStrechActionPane
      actionExtentRatio: 0.20, // 侧滑按钮所占的宽度
      enabled: true, // 是否启用侧滑 默认启用
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
        },
        //onWillDismiss: (actionType) {},
      ),
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
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => print('2222'),
          closeOnTap: false,
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => demo(),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          //onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          closeOnTap: false,
          //onTap: () => _showSnackBar('Delete', index),
        ),
      ],
    );
    ;
  }
}
