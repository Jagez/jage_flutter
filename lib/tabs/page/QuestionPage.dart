import 'package:flutter/material.dart';
import 'package:jage_app/widget/ChartsContentItem.dart';
import 'package:jage_app/widget/ContentText.dart';
import 'package:jage_app/widget/QuestionItemWidget.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int contentMaxLines = 2;
  bool _expandFlag = true;
  String currValue = "0";

  final ValueNotifier<List<String>> _selectList =
      ValueNotifier<List<String>>(<String>[
    "A. 如果总需求增长慢于总供给的增长，价格总水平就有可能上升",
    "B. 调查方案",
    "C. 数据分析",
    "D. 调查报告"
  ]);
  ValueNotifier<dynamic> _index = ValueNotifier<dynamic>({
    "chapter": "一、单项选择题（共 70 题，每题 1 分。每题的备选项中，只有 1 个最符合题意）",
    'questionText': "1. 调查活动的最终成果是（   ）。",
    'selectList': <String>[
      "A. 如果总需求增长慢于总供给的增长，价格总水平就有可能上升",
      "B. 调查方案",
      "C. 数据分析",
      "D. 调查报告"
    ],
    'selectIndex': 0,
    'textDirection': TextDirection.rtl,
    'textStyle': TextStyle(
      color: Color.fromRGBO(45, 45, 45, 1.0),
      fontSize: 18.0,
    ),
    //'decoration': BoxDecoration(),
  });
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _selectList.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("知识问答"),
        ),
        body: Container(
          child: ListView(
            primary: false, //当内容不超过显示大小，不显示上下拉指示器
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "初级经济师《经济基础知识》高频考点",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //fit: BoxFit.fill,
                      image: AssetImage("images/question/25.png"),
                      centerSlice: Rect.fromLTRB(19.0, 19.0, 21, 21),
                    ),
                  ),
                  // ListView(
                  //   children: [
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: MediaQuery.of(context).size.height,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           //fit: BoxFit.fill,
                  //           image: AssetImage("images/question/25.png"),
                  //           centerSlice: Rect.fromLTRB(19.0, 19.0, 21, 21),
                  //         ),
                  //       ),
                  //       margin: EdgeInsets.all(15.0),
                  //       child: Flex(
                  //         direction: Axis.vertical,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(15.0),
                  //             child: ContentTextWidget(
                  //               arguments: {
                  //                 "contentText":
                  //                     "fslakjfsasdfsdfadsfasdfewrwrefsdfsdfewrwdsfasdgwerwerwdfaldfkjslfjksl但是咖啡机拉萨的飞机塑料袋放进离开即使对方螺丝扣搭街坊",
                  //                 'textDirection': TextDirection.rtl,
                  //                 'textStyle': TextStyle(
                  //                   color: Color.fromRGBO(45, 45, 45, 1.0),
                  //                   fontSize: 17.0,
                  //                 ),
                  //               },
                  //             ),
                  //           ),
                  //           Spacer(),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: 
                    ValueListenableBuilder<dynamic>(
                      builder: _buildTest,
                      valueListenable: _index,
                    ),
                    
                    //不能刷新
                    // ValueListenableBuilder<List>(
                    //   builder: _buildSelection,
                    //   valueListenable: _selectList,
                    // ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 85.0, //TODO 按钮大小需要进一步调整,适应不同屏幕大小
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/question/36.png"),
                        ),
                      ),
                      child: Text("提交"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print("ontap");
                          _index.value['selectList'] = <String>[
                            "A.sas",
                            "B.sasa",
                            "C.qwqwq",
                            "D.yyttr"
                          ];
                          _index.value['questionText'] = "2. 你的问题是？";
                          _selectList.value = <String>[
                            "A.sas",
                            "B.sasa",
                            "C.qwqwq",
                            "D.yyttr"
                          ];
                        });
                      },
                      child: Container(
                        width: 85.0, //TODO 按钮大小需要进一步调整,适应不同屏幕大小
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/question/26.png"),
                          ),
                        ),
                        child: Text("下一题"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildSelection(BuildContext context, List value, Widget? child) {
    print(value.toString());
    return QuestionItemWidget(
      arguments: {
        "chapter": "一、单项选择题（共 70 题，每题 1 分。每题的备选项中，只有 1 个最符合题意）",
        'questionText': "1. 调查活动的最终成果是（   ）。",
        'selectList': value,
        'selectIndex': 0,
        'textDirection': TextDirection.rtl,
        'textStyle': TextStyle(
          color: Color.fromRGBO(45, 45, 45, 1.0),
          fontSize: 18.0,
        ),
        //'decoration': BoxDecoration(),
      },
    );
  }

  Widget _buildTest(BuildContext context, dynamic value1, Widget? child) {
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          final painter = TextPainter(
            text: TextSpan(
              text: value1['chapter'].toString(),
            ),
            maxLines: contentMaxLines,
            textDirection: TextDirection.ltr,
          );
          painter.layout(maxWidth: size.maxWidth);
          // if (!painter.didExceedMaxLines) {
          //   return Text(
          //     _chapterText,
          //     style: _textStyle,
          //   );
          // }

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value1['chapter'],
                maxLines: _expandFlag ? null : 2,
                style: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 1.0),
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value1['questionText'],
                  maxLines: _expandFlag ? null : 2,
                  style: TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 1.0),
                    fontSize: 18.0,
                  ),
                ),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: value1['selectList'][0].toString(),
                //isThreeLine: true,
                //dense: true,
                groupValue: currValue,
                title: Text(value1['selectList'][0]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: value1['selectList'][1].toString(),
                groupValue: currValue,
                title: Text(value1['selectList'][1]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: value1['selectList'][2].toString(),
                groupValue: currValue,
                title: Text(value1['selectList'][2]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: value1['selectList'][3].toString(),
                groupValue: currValue,
                title: Text(value1['selectList'][3]),
                onChanged: (value) {
                  setState(() {
                    currValue = value.toString();
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
