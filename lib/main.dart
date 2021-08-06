import 'package:flutter/material.dart';
import 'tabs/Tabs.dart';
import 'tabs/page/NewPage.dart';
import 'tabs/page/TabBarController.dart';
import 'tabs/page/UserInfo.dart';
void main() {
  runApp(JageApp());
}
class JageApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> routes = {
    //此处添加路由,可以传参
    //'/': (context)=>Tabs(),
    '/page': (context, {arguments})=>(NewPage(arguments: arguments)),
    '/tabBarController': (context)=>TabBarControllerPage(),
    '/userinfo': (context) => UserInfoPage(),
  };
  JageApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Tabs(),
        //initialRoute: '/',    //初始化根组件
        onGenerateRoute: (RouteSettings settings) {
          final String? name = settings.name;
          final Function? pageContentBuilder = this.routes[name];
          if (pageContentBuilder != null) {
            //带参
            if (settings.arguments != null) {
              final Route route = MaterialPageRoute(
                builder: (context)=>
                    pageContentBuilder(context, arguments: settings.arguments),
              );
              return route;
            //不带参
            }else{
              final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context),
              );
              return route;
            }
          }
        },
    );
  }
}