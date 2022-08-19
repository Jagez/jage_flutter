import 'dart:math';

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

  final ValueNotifier<List<Widget>> mMessagesList =
      ValueNotifier<List<Widget>>([]);
  String mMessage = "";
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      mMessage = _textEditingController.text;
    });
    //_scrollController.keepScrollOffset;
    mMessagesList.value.add(ChartsContent(arguments: {
      "contentText": "士大夫精神的粉红色短裤",
      'textDirection': TextDirection.rtl, //
      'textStyle': TextStyle(
        color: Color.fromRGBO(244, 244, 247, 1.0),
      ),
    }));
    mMessagesList.value.add(ChartsContent(arguments: {
      "contentText": "及我为哦为哦哦",
      'textDirection': TextDirection.rtl, //
      'textStyle': TextStyle(
        color: Color.fromRGBO(244, 244, 247, 1.0),
      ),
    }));
    mMessagesList.value.add(ChartsContent(arguments: {
      "contentText":
          "keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDragkeyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag",
      'textDirection': TextDirection.rtl, //
      'textStyle': TextStyle(
        color: Color.fromRGBO(244, 244, 247, 1.0),
      ),
    }));
    mMessagesList.value.add(ChartsContent(arguments: {
      "contentText": "据欸金额开具的空姐哦哦哦",
      'textDirection': TextDirection.rtl, //
      'textStyle': TextStyle(
        color: Color.fromRGBO(244, 244, 247, 1.0),
      ),
    }));
    mMessagesList.value.add(SizedBox(
      height: 70,
    ));
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

            ValueListenableBuilder<List<Widget>>(
              builder: _buildList,
              valueListenable: mMessagesList,
            ),
            // ListView(
            //   shrinkWrap: true,
            //   reverse: true,
            //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            //   children: [
            //     SizedBox(
            //       height: 70.0,
            //     ),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //     ChartsContent(),
            //   ],
            // ),
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
                  controller: _textEditingController,
                  //判断文本框是否为空,不为空则需改变按钮
                  onChanged: (str) {
                    if (str.isNotEmpty) {
                      mSendButton.value = "assets/icon/send.png";
                      setState(() {
                        mMessage = str;
                      });
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
                  print(mMessage);
                  //清除输入框的焦点
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    mMessagesList.value[mMessagesList.value.length - 1] =
                        ChartsContent(arguments: {
                      //'id': Random().nextInt(100),
                      "contentText": mMessage,
                      'textDirection': TextDirection.rtl, //
                      'textStyle': TextStyle(
                        color: Color.fromRGBO(244, 244, 247, 1.0),
                      ),
                    });
                    //mMessagesList.value.add();
                    mMessagesList.value.add(Expanded(
                      flex: 0,
                      child: SizedBox(
                        height: 70,
                      ),
                    ));
                    // _scrollController.animateTo(1,
                    //     duration: Duration(milliseconds: 300),
                    //     curve: Curves.ease);
                  });
                  mSendButton.value = "assets/icon/file2_2x.png";
                  _textEditingController.clear();
                  //不能在数据刷新之前滑动，所以加个延时动作
                  Future.delayed(Duration(milliseconds: 300), () {
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  });
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

  ListView _buildList(BuildContext context, List<Widget> list, Widget? child) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: list.length,
      shrinkWrap: true,
      reverse: false,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) {
        // if (list.length < index) {
        //   return list[index];
        // } else {
        //   return SizedBox(
        //     height: 70,
        //   );
        // }
        return list[index];
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mSendButton.dispose();
    mMessagesList.dispose();
    _textEditingController.dispose();
  }
}
