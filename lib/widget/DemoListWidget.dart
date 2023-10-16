import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DemoListWidget extends StatefulWidget {
  DemoListWidget({Key? key}) : super(key: key);

  @override
  _DemoListWidgetState createState() => _DemoListWidgetState();
}

class _DemoListWidgetState extends State<DemoListWidget> {
  bool _bottomFlag = false;
  _dialog() async {
    //dialog返回值的获取
    var data = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Warnning!"),
            content: Text("What is that?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, "one");
                },
                child: Text("It is one."),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'two');
                },
                child: Text("It is Two."),
              ),
            ],
          );
        });
    print(data);
  }

  _sampleDialog() async {
    var data = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Warnning!"),
            children: [
              SimpleDialogOption(
                onPressed: () {},
                child: Text("111"),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text("222"),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Text("333"),
              ),
            ],
          );
        });
    print(data);
  }

//这种模式的bottomsheet是阻塞的
  _modelBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              Text("分享"),
              Text("分享"),
              Text("分享"),
            ],
          ),
        );
      },
    );
  }

  Widget _customBottomSheet() => BottomSheet(
        onClosing: () {},
        builder: (_) => (Container(
          height: 800,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "images/thumb_unit_profile_100111.png",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80.0),
                topRight: Radius.circular(80.0)),
          ),
          child: Text("bottomSheet"),
        )),
      );

  Future<Map> _deviceInfo() async {
    DeviceInfoPlugin infoPlugin = new DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await infoPlugin.androidInfo;
    var info = androidDeviceInfo.toMap();
    print(info);
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        //如果有输入框在该listview中，滑动可隐藏软键盘
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 30, 30, 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/camera');
                  },
                  child: Text("camera"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fl_test');
                  },
                  child: Text("fl_test"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/spine');
                  },
                  child: Text("Spine"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gallery');
                  },
                  child: Text("流水布局"),
                ),
                CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ffi');
                  },
                  child: Text("FFI"),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/update');
                  },
                  child: Text("检查更新APP"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/pcr');
                  },
                  child: Text("公主连结 Re:dive!"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/question');
                  },
                  child: Text("知识问答"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/social');
                  },
                  child: Text("social"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/media');
                  },
                  child: Text("media"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/filemanager');
                  },
                  child: Text("filemanager"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/weather');
                  },
                  child: Text("weather"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/timeline');
                  },
                  child: Text("timeline"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/battery');
                  },
                  child: Text("battery"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/floatbottombar');
                  },
                  child: Text("底部浮动栏"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dinner');
                  },
                  child: Text("最后的晚餐"),
                ),
                TextField(
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
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sewa');
                  },
                  child: Text("SEWA"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/flchart');
                  },
                  child: Text("flchart"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/qrscanner');
                  },
                  child: Text("QrScanner"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/qr');
                  },
                  child: Text("QR"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/stackCard');
                  },
                  child: Text("stackCard"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/lottie');
                  },
                  child: Text("Lottie Demo"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/connectivity');
                  },
                  child: Text("Connectivity_plus"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Share.share('text', subject: "i am object.");
                    //多文件
                    //Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
                    //Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
                  },
                  child: Text("share plus"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signature');
                  },
                  child: Text("签名"),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _bottomFlag = !_bottomFlag;
                      _bottomFlag
                          ? Scaffold.of(context)
                              .showBottomSheet((_) => _customBottomSheet())
                          : Navigator.pop(context);
                    });
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  icon: Icon(Icons.share),
                  label: Text("分享"),
                ),
                MaterialButton(
                  height: 40.0,
                  textColor: Colors.white,
                  color: Colors.yellow,
                  //splashColor: Colors.,
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, '/login');
                    });
                  },
                  child: Text("Login"),
                ),
                OutlinedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, '/buttons');
                    });
                  },
                  child: Text("ButtonDemo"),
                ),
                ElevatedButton(
                  child: Text("alterdialog"),
                  onPressed: () {
                    setState(() {
                      _dialog();
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("sampledialog"),
                  onPressed: () {
                    setState(() {
                      _sampleDialog();
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("bottomSheet"),
                  onPressed: () {
                    setState(() {
                      _modelBottomSheet();
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("deviceInfo"),
                  onPressed: () {
                    setState(() {
                      _deviceInfo();
                    });
                  },
                ),
                // ElevatedButton(
                //   child: Text("Open"),
                //   onPressed: (){
                //     //普通路由
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context)=>NewPage()
                //       )
                //     );
                //     //替换路由
                //     //Navigator.of(context).pushReplacementNamed('routeName');

                //   },
                // ),
                ElevatedButton(
                  child: Text("Return"),
                  onPressed: () {
                    //命名路由
                    //Navigator.of(context).pushNamed('/page');

                    //传参路由
                    Navigator.of(context).pushNamed(
                      '/page',
                      arguments: {"name": "12"},
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("跳转到TabControllerPage"),
                  style: ButtonStyle(
                    //阴影
                    elevation: MaterialStateProperty.all(10.0),
                    shape: MaterialStateProperty.all(
                      //RoundedRectangleBorder(side: BorderSide(color: Colors.red))
                      //CircleBorder(side: BorderSide(color: Colors.yellowAccent, width: 2.0)),
                      RoundedRectangleBorder(
                          //side: BorderSide(color: Colors.yellowAccent, width: 1.5),
                          borderRadius: BorderRadius.circular(13.0)),
                    ),
                    //水波纹颜色
                    overlayColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tabBarController');
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      child: ElevatedButton(
                        child: Text("宽高按钮"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text("自适应按钮"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      //padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Colors.yellow,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: AssetImage("images/thumb_unit_profile_100231.png"),
                        // )
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellowAccent.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        child: Text(""),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          // side: MaterialStateProperty.all(
                          //   BorderSide(
                          //     width: 2.0,
                          //     color: Colors.yellow,
                          //     style: BorderStyle.solid,
                          //   ),
                          // ),
                          shape: MaterialStateProperty.all(CircleBorder(
                              //side: BorderSide(color: Colors.red, width: 2.0),

                              )),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              //offset: Offset(-6.0, 6.0), //阴影x轴偏移量
                              blurRadius: 10, //阴影模糊程度
                              spreadRadius: 10 //阴影扩散程度
                              ),
                        ],
                      ),
                      //child: Text("BoxShadow(绘制阴影)+Container+BoxDecoration"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "时间和日期",
                          style: TextStyle(
                            fontFamily: 'lover',
                            fontStyle: FontStyle.italic,
                            fontSize: 25.0,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            var now = DateTime.now();
                            print(now);
                            print(now.millisecondsSinceEpoch);
                            print(DateTime.fromMillisecondsSinceEpoch(
                                now.millisecondsSinceEpoch));
                            Navigator.pushNamed(context, "/dates");
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("设计"),
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, "/design");
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ]);
  }
}
