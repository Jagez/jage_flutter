import 'package:flutter/material.dart';
import 'res/ListData.dart';

class FirstComponent extends StatelessWidget {

  List<Widget> _getInfo() {
    
    var data = listData.map((value) {
        return ListTile(
          title: Text(value['name']),
          subtitle: Text(value['introdution']),
        );
      });
      return data.toList();
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (content, index){
        return ListTile(
          title: Text(
            listData[index]['name'],
          ),
        );
      });
  }
}
