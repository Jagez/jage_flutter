import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'tabs/Tabs.dart';
import 'tabs/page/NewPage.dart';
import 'tabs/page/TabBarController.dart';
import 'tabs/page/UserInfo.dart';
import 'tabs/page/Dates.dart';
import 'tabs/page/Design.dart';
import 'tabs/page/Charts.dart';
import 'tabs/page/ButtonDemo.dart';
import 'tabs/page/Login.dart';
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
    '/dates': (context) => DatesPage(),
    '/design': (context) => DesignPage(),
    '/charts': (context) => ChartsPage(),
    '/buttons': (context) => ButtonDemoPage(),
    '/login': (context) => LoginPage(),
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
        //国际化
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CH'),
        ],
    );
  }
}