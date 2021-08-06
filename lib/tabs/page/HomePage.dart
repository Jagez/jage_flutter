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
                child: ElevatedButton(
                  child: Text("圆形按钮"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      CircleBorder(
                        //side: BorderSide(color: Colors.red, width: 2.0),
                        
                      )
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
