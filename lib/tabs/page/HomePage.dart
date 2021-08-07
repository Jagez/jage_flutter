import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NewPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title可以是widget，所有可以把TabBar写在title中，而不是bottom
        title: TabBar(
          tabs: [
            Tab(
              text: "ooo",
            ),
            Tab(
              text: "xxx",
            ),
          ],
        ),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(text: "ss",),
        //     Tab(text: "xx",),
        //   ],
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
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
                child: Text("BoxShadow(绘制阴影)+Container+BoxDecoration"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellowAccent.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 10,
                      ),
                    ]),
                child: ElevatedButton(
                  child: Text("bu"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    shape: MaterialStateProperty.all(
                      CircleBorder(
                        //side: BorderSide(color: Colors.red, width: 2.0),

                        )
                      ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
