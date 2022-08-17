import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widget/PopupMenu.dart';
import '../../widget/ChartsContentItem.dart';

class ChartsPage extends StatefulWidget {
  final dynamic arguments;
  ChartsPage({Key? key, this.arguments}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  //动态改变发送按钮
  final ValueNotifier<String> mSendButton =
      ValueNotifier<String>("assets/icon/file2_2x.png");

  List<Widget> mMessagesList = <Widget>[];

  @override
  void initState() {
    super.initState();
    mMessagesList.add(SizedBox(
      height: 70.0,
    ));
    mMessagesList.add(ChartsContent());
    mMessagesList.add(ChartsContent());
    mMessagesList.add(ChartsContent());
    mMessagesList.add(ChartsContent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(30, 30, 73, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(30, 30, 73, 1.0),
        // leading: Image.asset(
        //   "images/icon_quest_31002.png",
        // ),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Hero(
                tag: "icon_head",
                child: Image.asset(
                  "images/icon_quest_31002.png",
                  width: 35.0,
                ),
              ),
            ),
            Text(
              "xxx",
              style: TextStyle(
                fontFamily: "SAO",
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuWidget(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(30, 30, 73, 1.0),
        ),
        child: Stack(
          //在下拉列表别滑动时隐藏键盘
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          //direction: Axis.vertical,
          children: [
            //Spacer(),
            //_buildMessageList(),
            ListView.builder(
              shrinkWrap: true,
              reverse: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) {
                return mMessagesList[index];
              },
            ),
            ListView(
              shrinkWrap: true,
              reverse: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                SizedBox(
                  height: 70.0,
                ),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
                ChartsContent(),
              ],
            ),
            ////_buildMessageInput(),
            Align(
              alignment: Alignment(1, 1),
              child: _buildMessageInput(),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: ,
    );
  }

  Widget _buildMessageList() {
    return Container(
      child: ListView(
        children: [],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      width: double.infinity,
      height: 70.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromRGBO(24, 24, 58, 1.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 34, 65, 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset(
                  "assets/icon/voice1_2x.png",
                  width: 30.0,
                  color: Color.fromRGBO(8, 255, 255, 1.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                //width: 150.0,
                width: double.infinity,
                height: 50.0, //注意最小的高度（字体大小），否则会出现裁剪
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 34, 65, 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),
                    hintText: "Message",
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: 15.0,
                      fontFamily: "SAO",
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  //判断文本框是否为空,不为空则需改变按钮
                  onChanged: (str) {
                    if (str.isNotEmpty) {
                      mSendButton.value = "assets/icon/send.png";
                    } else {
                      mSendButton.value = "assets/icon/file2_2x.png";
                    }
                  },
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 34, 65, 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Image.asset(
                  "assets/icon/emot2_2x.png",
                  width: 30.0,
                  color: Color.fromRGBO(8, 255, 255, 1.0),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: GestureDetector(
                onTap: () {
                  //print(widget.arguments["targetId"]);
                },
                child: ValueListenableBuilder<String>(
                  builder: _buildIcon,
                  valueListenable: mSendButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context, String path, Widget? child) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 34, 65, 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Image.asset(
        path, //
        width: 30.0,
        color: Color.fromRGBO(8, 255, 255, 1.0),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mSendButton.dispose();
  }
}
