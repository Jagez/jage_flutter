import 'package:flutter/material.dart';
//import 'FirstComponent.dart';
import 'tabs/Tabs.dart';
import 'tabs/page/NewPage.dart';
void main() {
  runApp(JageApp());
}
class JageApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> routes = {
    //此处添加路由,可以传参
    '/page': (context, {arguments})=>(NewPage(arguments: arguments)),
  };
  JageApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Tabs(),
        onGenerateRoute: (RouteSettings settings) {
          final String? name = settings.name;
          final Function? pageContentBuilder = this.routes[name];
          if (pageContentBuilder != null) {
            if (settings.arguments != null) {
              final Route route = MaterialPageRoute(
                builder: (context)=>
                    pageContentBuilder(context, arguments: settings.arguments),
              );
              return route;
            }
          }
        },
    );
  }
}