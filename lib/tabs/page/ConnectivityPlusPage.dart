
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityPlusPage extends StatefulWidget {
  ConnectivityPlusPage({Key? key}) : super(key: key);

  @override
  _ConnectivityPlusPageState createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {

  late StreamSubscription<ConnectivityResult> subscription;
  String desc = '';

  Future<String> getConnectivityRes() async {
    var connectivityRes = await (Connectivity().checkConnectivity());
    if (connectivityRes == ConnectivityResult.mobile) {
      return "mobile";
    } else if (connectivityRes == ConnectivityResult.wifi) {
      return "wifi";
    }
    return "";
  }

  @override
  void initState()  {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((event) { });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String str = "show Connectivity res";
    return Scaffold(
      appBar: AppBar(
        title: Text("ConnectivityPlusPage"),
        
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              getConnectivityRes().then((value) {
                print(value);
                str = value;
              });
            });
          },
          child: Text(str),
        ),
      ),
    );
  }
}