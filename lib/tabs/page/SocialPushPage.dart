import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../widget/SocialGridImage.dart';

class SocialPush extends StatefulWidget {
  const SocialPush({Key? key}) : super(key: key);

  @override
  State<SocialPush> createState() => _SocialPushState();
}

class _SocialPushState extends State<SocialPush> {
  TextEditingController _textEditingController = TextEditingController();
  List<AssetEntity> selecedAssets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("发布"),
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
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
                padding: const EdgeInsets.all(18.0),
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
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              height: 250,
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 225, 241),
                border: Border.all(color: Color.fromARGB(97, 199, 198, 198), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              //padding: EdgeInsets.symmetric(horizontal: 30),
              child: ListTile(
                //contentPadding: EdgeInsets.all(12),
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
          ),
          SocialGridImage(selecedAssets: selecedAssets, isShow: false, picRowNum: 4,),
        ]),
      ),
    );
  }
}
