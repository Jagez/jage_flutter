//import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class BatteryInfo extends StatefulWidget {
  BatteryInfo({Key? key}) : super(key: key);

  @override
  _BatteryInfoState createState() => _BatteryInfoState();
}

class _BatteryInfoState extends State<BatteryInfo> {
  @override
  Widget build(BuildContext context) {
    String text = "get battery";
    return Scaffold(
      appBar: AppBar(
        title: Text("BatteryInfo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            setState(() {
              batteryInfo().then((value) {
                text = value.toString();
                print(text);
              });
            });
          }, 
          child: Text(text),
        ),
      ),
    );
  }

  Future<String> batteryInfo() async {

    String info = '';
    // var battery = Battery();
    // int level;
    // level = await battery.batteryLevel;
    // battery.onBatteryStateChanged.listen((BatteryState state) { 
    //   if (state == BatteryState.charging) {
    //     //正在充电
    //   } else if (state == BatteryState.discharging) {
    //     //未充电
    //   } else if (state == BatteryState.full) {
    //     //充满电
    //   } else if (state == BatteryState.unknown) {
    //     //未知
    //   }
    //     info = state.toString() + " " + level.toString() + "%";
    //     print(info);
    // });
    return info;
  }
}