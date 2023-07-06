import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../widget/SocialGridImage.dart';


//TODO：缓存页面,缓存页面需要改为网络请求。解决旋转屏幕导致页面更新后，图片数据丢失.
class SocialPush extends StatefulWidget {
  const SocialPush({Key? key}) : super(key: key);

  @override
  State<SocialPush> createState() => _SocialPushState();
}

class _SocialPushState extends State<SocialPush> with SingleTickerProviderStateMixin  {
  TextEditingController _textEditingController = TextEditingController();
  List<AssetEntity> selecedAssets = [];
  PageController _pageController = PageController(initialPage: 0);
  bool isActive = false; //光标是否聚焦在文本域
  bool isPicker = false; //是否选择了图片
  late AnimationController scaleButtonController;
  late CurvedAnimation animation;
  late Animation<num> scale;

  @override
  void initState() {
    super.initState();
    //1、创建AnimationController供屏幕缩放动画控制。控制缩放动画的大小和移动是通过动画Controller发送的消息来实现的。
    // scaleButtonController是一个动画控制器，可以通过发送消息来控制
    //需要混入SingleTickerProviderStateMixin类
    scaleButtonController = AnimationController( duration: Duration(milliseconds: 100), vsync: this);
    //2、动画添加Curve效果
    animation = CurvedAnimation(parent: scaleButtonController, curve: Curves.easeInOut, );
    //3、监听动画
    animation.addListener(() { });

    //4、设置值的范围
    scale = Tween(begin: 1, end: 1.1).animate(scaleButtonController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            primary: false,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Canncel",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.popAndPushNamed(context, '/social');
                          });
                        },
                        style: ButtonStyle(
                          //阴影
                          elevation: MaterialStateProperty.all(10.0),
                          shape: MaterialStateProperty.all(
                            //RoundedRectangleBorder(side: BorderSide(color: Colors.red))
                            //CircleBorder(side: BorderSide(color: Colors.yellowAccent, width: 2.0)),
                            RoundedRectangleBorder(
                                //side: BorderSide(color: Colors.yellowAccent, width: 1.5),
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                          //水波纹颜色
                          overlayColor: MaterialStateProperty.all(Colors.red),
                        ),
                        child: Text(
                          "Push",
                          style: TextStyle(fontSize: 22.0),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  //width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  height: 100,
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      TextField(
                        controller: _textEditingController,
                        //focusNode: focusNode,
                        maxLines: 20,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(800),
                        ],
                        decoration: InputDecoration(
                          hintText: "请输入内容",
                          hintStyle: TextStyle(fontSize: 16),
                          isDense: true,
                          contentPadding: EdgeInsets.only(
                            left: 0,
                            top: 0,
                            bottom: 4,
                            right: 0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 1),
                        child: Text("1/30"),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    border: Border.all(color: Colors.white38, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                // decoration: BoxDecoration(
                //   color: Color.fromARGB(255, 212, 225, 241),
                //   border: Border.all(
                //       color: Color.fromARGB(97, 199, 198, 198), width: 2),
                //   borderRadius: BorderRadius.circular(20),
                // ),
                //padding: EdgeInsets.symmetric(horizontal: 30),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  //dense: true,
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                    size: 37,
                  ),
                  title: Text("shanghai"),
                  trailing: Text("不显示"),
                ),
              ),
              SizedBox(
                height: 220,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    _buildGridImagePage(),
                    _buildVoicePage(),
                    _buildTagPage(),
                  ],
                ),
              ),
              Divider(),
              AnimatedBuilder(
                animation: scale,
                builder: (context, child) {
                  return Transform.scale(
                    alignment: Alignment.center,
                    scale: scale.value.toDouble(),
                    //child: widget,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          //width: 130,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(
                                      Colors.blue[50]),
                            ),
                            onPressed: () {
                              _pageController.jumpToPage(0);
                              scaleButtonController.forward();
                            },
                            icon: Icon(Icons.photo_outlined,
                                color: Colors.blue),
                            label: Text(
                              "图片",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          //width: 130,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(
                                      Colors.blue[50]),
                            ),
                            onPressed: () {
                              _pageController.jumpToPage(1);
                            },
                            icon: Icon(Icons.keyboard_voice_rounded,
                                color: Colors.blue),
                            label: Text(
                              "语音",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(0),
                          height: 50,
                          //width: 150,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(
                                      Colors.amber[600]),
                            ),
                            onPressed: () {
                              _pageController.jumpToPage(2);
                            },
                            icon:
                                Icon(Icons.tag, color: Colors.black54),
                            label: Text(
                              "标签",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildGridImagePage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SocialGridImage(
        selecedAssets: selecedAssets,
        isShow: false,
        picRowNum: 4,
      ),
    );
  }

  Widget _buildVoicePage() {
    return Container();
  }

  Widget _buildTagPage() {
    return Container();
  }
}
