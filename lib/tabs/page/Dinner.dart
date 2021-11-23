import 'package:flutter/material.dart';

class DinnerPage extends StatefulWidget {
  DinnerPage({Key? key}) : super(key: key);

  @override
  _DinnerPageState createState() => _DinnerPageState();
}

class _DinnerPageState extends State<DinnerPage> {
  String curValue = "星期日";
  final List<String> info = <String>[
    "星期日",
    "星期一",
    "星期二",
    "星期三",
    "星期四",
    "星期五",
    "星期六",
  ].toList();

  final List<String> breakfastInfo_Monday = <String>[
    "三丝炒米粉28大洋",
    "榨菜肉丝汤米粉/河/面28大洋",
    "餐蛋三文治18大洋",
    "香菇滑鸡粥20大洋",
    "牛腩焖伊面30大洋",
  ];
  final List<String> breakfastInfo_Tuesday = <String>[
    "黑椒牛柳炒意粉30大洋",
    "芥菜咸鸡粥22大洋",
    "排骨汤河粉/面/米粉",
    "吞拿三文治20大洋",
    "雪菜肉丝焖米粉28大洋",
  ];
  final List<String> breakfastInfo_Wednsday = <String>[
    "牛腩汤河粉/面/米粉28大洋",
    "芝士餐肉三文治20大洋",
    "干炒牛河28大洋",
    "菜干咸骨粥18大洋",
    "排骨焖伊面30大洋",
  ];
  final List<String> breakfastInfo_Thursday = <String>[
    "净云吞/8粒28大洋",
    "芝士肉餐意粉26大洋",
    "菜心肉片炒米粉28大洋",
    "芫茜鱼片粥20大洋",
    "火腿蛋三文治20大洋",
  ];
  final List<String> breakfastInfo_Friday = <String>[
    "餐肉蛋炒米粉28大洋",
    "澳门猪扒包21大洋",
    "华苑大虾焖伊面30大洋",
    "炒蛋咸牛肉菠萝包20大洋",
  ];
  final List<String> breakfastInfo_Saturdy = <String>[
    "牛腩蒸猪肠汤粉28大洋",
    "猪扒三文治22大洋",
    "生滚牛肉粥20大洋",
    "枸杞猪杂汤米粉/河粉28大洋",
    "叉烧蛋炒米粉28大洋",
    "星州炒米粉30大洋",
    "香菇滑鸡公仔面28大洋",
  ];
  final List<String> breakfastInfo_Sunday = <String>[
    "牛腩蒸猪肠汤粉28大洋",
    "猪扒三文治22大洋",
    "生滚牛肉粥20大洋",
    "枸杞猪杂汤米粉/河粉28大洋",
    "叉烧蛋炒米粉28大洋",
    "星州炒米粉30大洋",
    "香菇滑鸡公仔面28大洋",
  ];

  final List<String> dinnerInfo_Monday = <String>[
    "子姜焖鸭饭30大洋",
    "蜜汁叉烧饭32大洋",
    "川味辣子鸡饭30大洋",
    "凉瓜牛肉饭32大洋",
    "烧肉拼油鸡饭36大洋",
    "鲜菇肉片饭32大洋",
    "支竹排骨饭32大洋",
    "叉烧炒蛋饭30大洋",
    "咖喱牛腩饭43",
  ];
  final List<String> dinnerInfo_Tuesday = <String>[
    "凉瓜排骨饭",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  final List<String> dinnerInfo_Wednsday = <String>[];
  final List<String> dinnerInfo_Thursday = <String>[];
  final List<String> dinnerInfo_Friday = <String>[];
  final List<String> dinnerInfo_Saturday = <String>[];
  final List<String> dinnerInfo_Sunday = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("美味的饭菜任选任吃"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ! crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: curValue,
                    underline: Container(
                      color: const Color(0x00ff00ff),
                      height: 1,
                    ),
                    onChanged: (dynamic value) {
                      setState(() { curValue = value; });
                    },
                    items: info.map((String value) {
                      return DropdownMenuItem<String>(
                        // ? ignore: unnecessary_null_comparison
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton(
                    value: curValue,
                    underline: Container(
                      color: const Color(0x00ff00ff),
                      height: 1,
                    ),
                    onChanged: (dynamic value) {
                      setState(() {
                        curValue = value;
                      });
                    },
                    items: info.map((String value) {
                      return DropdownMenuItem<String>(
                        // ignore: unnecessary_null_comparison
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
