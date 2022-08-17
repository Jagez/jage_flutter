import 'package:flutter/material.dart';
import 'package:jage_app/function/SocialInfo.dart';
import 'package:jage_app/widget/SocialWidget.dart';

class SocialPage extends StatefulWidget {
  SocialPage({Key? key}) : super(key: key);

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  late SocialInfo info1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    info1 = SocialInfo(
      header: "http://jage.cktyun.com/a.png",
      content: "由丸山くがね 著作、so-bin 担任插画、并曾三度被改编成电视动画的轻小说作品"
          "《OVERLORD》。官方在 8 日所举办的生放送节目中正式告知动画四期制作确定，并释出前导视"
          "觉图、制作团队与声优名单。"
          "同时，官方也一并宣布完全新作剧场版“圣王国篇”制作确定。有关更多消息还有待官方后续公开。"
          "然后，官方也是出来自原作 丸山くがね、角色原案・so-bin、伊藤尚往监督以及系列构成的"
          " 菅原雪绘等人的留言。如有兴趣的，不妨点开下图来观看。",
      title: "title",
      subtitle: "subtitle",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SocialPage"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            SocialWidget(info: info1),
            //SocialWidget(),
            //SocialWidget(),
            //SocialWidget(),
          ],
        ),
      ),
    );
  }
}
