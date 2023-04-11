import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jage_app/tabs/page/FFIPage.dart';
import 'package:jage_app/tabs/page/GalleryPage.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jage_app/tabs/page/MediaPage.dart';
import 'package:jage_app/tabs/page/PrincessConnectPage.dart';
import 'package:jage_app/tabs/page/Signature.dart';
import 'package:jage_app/tabs/page/SocialPage.dart';
import 'package:jage_app/tabs/page/TimeLine.dart';
import 'package:jage_app/tabs/page/Weather.dart';
import 'package:jage_app/tabs/page/WeatherDetail.dart';
import 'package:jage_app/tabs/page/princess/BattlePage.dart';
import 'package:jage_app/tabs/page/princess/MusicPage.dart';
import 'package:jage_app/theme.dart';
import 'package:jage_app/widget/GalleryWidget.dart';
import 'tabs/Tabs.dart';
import 'tabs/page/NewPage.dart';
import 'tabs/page/TabBarController.dart';
import 'tabs/page/UserInfo.dart';
import 'tabs/page/Dates.dart';
import 'tabs/page/Design.dart';
import 'tabs/page/Charts.dart';
import 'tabs/page/ButtonDemo.dart';
import 'tabs/page/Login.dart';
import 'tabs/page/ConnectivityPlusPage.dart';
import 'tabs/page/LottiePage.dart';
import 'tabs/page/DesignCardPage.dart';
import 'tabs/page/Qr.dart';
import 'tabs/page/QrScanner.dart';
import 'tabs/page/flchart.dart';
import 'tabs/page/SewaDesign.dart';
import 'tabs/page/Dinner.dart';
import 'tabs/page/FloatBottomBar.dart';
import 'tabs/page/BatteryInfo.dart';
import 'tabs/page/FileManager.dart';
import 'tabs/page/QuestionPage.dart';
import 'tabs/page/FileSelectPage.dart';
import 'tabs/page/SocialPushPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(JageApp());
}

class JageApp extends StatefulWidget {
  JageApp({Key? key}) : super(key: key);

  @override
  _JageAppState createState() => _JageAppState();
}

class _JageAppState extends State<JageApp> with WidgetsBindingObserver {
  bool _isGrey = false;

  final Map<String, Widget Function(BuildContext)> routes = {
    //此处添加路由,可以传参
    //'/': (context)=>Tabs(),
    '/page': (context, {arguments}) => (NewPage(arguments: arguments)),
    '/tabBarController': (context) => TabBarControllerPage(),
    '/userinfo': (context) => UserInfoPage(),
    '/dates': (context) => DatesPage(),
    '/design': (context) => DesignPage(),
    '/charts': (context, {arguments}) => ChartsPage(
          arguments: arguments,
        ),
    '/buttons': (context) => ButtonDemoPage(),
    '/login': (context) => LoginPage(),
    '/signature': (context) => SignaturePage(),
    '/connectivity': (context) => ConnectivityPlusPage(),
    '/lottie': (context) => LottiePage(),
    '/stackCard': (context) => DesignCardPage(),
    '/qr': (context) => QrPage(),
    '/qrscanner': (context) => QRViewExample(),
    '/flchart': (context) => ChartPage(),
    '/sewa': (context) => SewaDesignPage(),
    '/dinner': (context) => DinnerPage(),
    '/floatbottombar': (context) => FloatBottomBarPage(),
    '/battery': (context) => BatteryInfo(),
    '/timeline': (context) => TimelinePage(),
    '/weather': (context) => WeatherPage(),
    '/weatherDetail': (context) => WeatherDetailPage(),
    '/filemanager': (context) => FileManager(),
    '/media': (context) => MediaPage(),
    '/social': (context) => SocialPage(),
    //'/getx': (context) => GetxTestPage(),
    '/question': (context) => QuestionPage(),
    '/selectUploadFile': (context, {arguments}) => FileSelectPage(
          arguments: arguments,
        ),
    '/pcr': (context) => PrincessConnectPage(),
    '/battle': (context) => BattlePage(),
    '/music': (context) => MusicPage(),
    '/ffi': (context) => FFIPage(),
    '/social-push': (context) => SocialPush(),
    '/gallery': (context) => GalleryPage(),
  };

  bool _bHidden = false;

  @override
  void initState() {
    super.initState();

    //启用监听生命周期状态
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

//要实现后台遮挡Android不管用
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState: $state");
    setState(() {
      _bHidden = state != AppLifecycleState.resumed;
    });
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        //_bHidden = true;
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isGrey 
    ? ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
      child: _buildMaterialApp(),
    )
    : _buildMaterialApp();
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [      //Tabs()
            if (_bHidden) Container(color: Colors.orange[800],),
            Tabs(),
          ],
        ),
        //darkTheme: darkThemeData(context),
        themeMode: ThemeMode.light,
        //initialRoute: '/',    //初始化根组件
        onGenerateRoute: (RouteSettings settings) {
          final String? name = settings.name;
          final Function? pageContentBuilder = this.routes[name];
          if (pageContentBuilder != null) {
            //带参
            if (settings.arguments != null) {
              final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments),
              );
              return route;
              //不带参
            } else {
              final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context),
              );
              return route;
            }
          }
          return null;
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
