import 'dart:io';

import 'package:file/file.dart' as FILE;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FileSelectPage extends StatefulWidget {
  final dynamic arguments;
  FileSelectPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<FileSelectPage> createState() => _FileSelectPageState();
}

class _FileSelectPageState extends State<FileSelectPage> {
  late final String _directory;
  late final List<FileSystemEntity> _listEntity;
  int currIndex = 0;
  int lenght = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //传入打开的目录 recursive: true是否递归
    _directory = widget.arguments['directory'];
    Directory dir = Directory(_directory).parent.parent;
    _listEntity = dir.listSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择文件"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _listEntity.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildListWidget(_listEntity.elementAt(index));
          },
        ),
      ),
    );
  }

  Widget _buildListWidget(FileSystemEntity fileEntity) {
    bool isFile = fileEntity.statSync().type == FILE.FileSystemEntityType.file
        ? true
        : false;
    bool isDir =
        fileEntity.statSync().type == FILE.FileSystemEntityType.directory
            ? true
            : false;
    int dirSubs = 0;
    if (isDir) {
      dirSubs = Directory(fileEntity.path).listSync().length;
    }
    String path = fileEntity.path;
    List<String> tempStr = path.split("/");
    String fileName = tempStr[tempStr.length - 1];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              //currIndex = key;
            });
          },
          onLongPress: () {
            setState(() {
              //currIndex = key;
            });
          },
          child: Container(
            decoration: currIndex == 1
                ? BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF8355FF), Color(0xFFB642FF)],
                        stops: [.0, .6]),
                    borderRadius: BorderRadius.circular(12.0),
                  )
                : null,
            width: double.infinity,
            child: ListTile(
              dense: false,
              leading: Icon(
                Icons.no_accounts,
                size: 50,
              ),
              title: Text(
                fileName,
                style: TextStyle(
                    //color: currIndex == key ? Colors.white : null,
                    ),
              ),
              subtitle: Text(
                isFile ? fileEntity.statSync().modified.toString() : "",
                style: TextStyle(
                    //color: currIndex == key ? Colors.white70 : null,
                    ),
              ),
              trailing: isFile
                  ? null
                  : Text(
                      '$dirSubs项',
                      style: TextStyle(
                        fontSize: 10.0,
                        //color: currIndex == key ? Colors.white70 : null,
                      ),
                    ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
