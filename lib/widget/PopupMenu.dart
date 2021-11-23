import 'package:flutter/material.dart';

class PopupMenuWidget extends StatefulWidget {
  PopupMenuWidget({Key? key}) : super(key: key);

  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        List<PopupMenuItem> list = [];
        list.add(PopupMenuItem<String>(
          child: Wrap(
            spacing: 10.0,
            children: [
              Icon(Icons.info_outline),
              Text("关于"),
            ],
          ),
        ));
        return list;
      },
      offset: Offset(-20, 50.0),
      color: Color.fromRGBO(40, 40, 97, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )
      ),
    );
  }
}
