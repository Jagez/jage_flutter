import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDemoPage extends StatefulWidget {
  ButtonDemoPage({Key? key}) : super(key: key);

  @override
  _ButtonDemoPageState createState() => _ButtonDemoPageState();
}

class _ButtonDemoPageState extends State<ButtonDemoPage> {
  List<bool> _isSelected = [false, false, false];
  bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 172, 238, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0, 172, 238, 1.0),
        title: Text("ButtonDemoPage"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          children: [
            ToggleButtons(
              children: [
                Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                ),
                Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
                Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
              ],
              isSelected: _isSelected,
              borderColor: Colors.white,
              splashColor: Color.fromRGBO(93, 202, 245, 1.0),
              selectedColor: Colors.white,
              selectedBorderColor: Colors.white,
              fillColor: Color.fromRGBO(93, 202, 245, 1.0),
              borderRadius: BorderRadius.circular(10.0),
              onPressed: (value) {
                setState(() {
                  //单选切换
                  _isSelected = _isSelected.map((e) => false).toList();
                  _isSelected[value] = true;

                  //多选切换
                  //_isSelected[value] = !_isSelected[value];
                });
              },
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.all(15.0),
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text("button"),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        color: Colors.white,
                      )),
                ),
                Switch(
                    value: _flag,
                    onChanged: (flag) {
                      setState(() {
                        _flag = flag;
                      });
                    }),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: _flag ? Color.fromRGBO(65, 193, 242, 1.0) : Color.fromRGBO(0, 172, 237, 1.0),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.white),
              ),
              child: CupertinoSwitch(
                value: _flag,
                onChanged: (value) {
                  setState(() {
                    _flag = value;
                  });
                },
                activeColor: Color.fromRGBO(65, 193, 242, 1.0),
                trackColor: Color.fromRGBO(0, 172, 237, 1.0),
              ),
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                side: BorderSide(
                  color: Colors.white,
                ),
                shape: CircleBorder(),
              ),
              onPressed: () {},
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
            OutlinedButton(
              style: TextButton.styleFrom(
                side: BorderSide(
                  color: Colors.white,
                ),
                shape: CircleBorder(),
              ),
              onPressed: () {},
              child: Icon(
                Icons.stop,
                color: Colors.white,
              ),
            ),
            DropdownButton(
              items: [],
            ),
          ],
        ),
      ),
    );
  }
}
