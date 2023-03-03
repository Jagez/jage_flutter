import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:jage_app/function/JageFileManager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

// Pointer<Int8> 对应C 的char*
// Dart传参时使用的char*，Utf.toUtf8(String)
typedef Native_Str = Pointer<Int8> Function();
typedef FFI_Str = Pointer<Int8> Function();

// 此处的Void是对应C的void
typedef Native_process_img_Func = Void Function(Pointer<Int8>, Pointer<Int8>);
typedef Process_img_Func = void Function(Pointer<Int8>, Pointer<Int8>);

typedef Native_erode_img_Func = Pointer<Int8> Function(
    Pointer<Int8>, Pointer<Int8>);
typedef Erode_img_Func = Pointer<Int8> Function(Pointer<Int8>, Pointer<Int8>);

class FFIPage extends StatefulWidget {
  FFIPage({Key? key}) : super(key: key);

  @override
  State<FFIPage> createState() => _FFIPageState();
}

class _FFIPageState extends State<FFIPage> {
  @override
  Widget build(BuildContext context) {
    final DynamicLibrary opencvLib = DynamicLibrary.open("libnative-lib.so");
    FFI_Str verFunc = opencvLib.lookupFunction<Native_Str, FFI_Str>('version');
    //调用C库函数
    Pointer<Int8> result = verFunc();
    String str = result.cast<Utf8>().toDartString();

    Process_img_Func process_img_func =
        opencvLib.lookupFunction<Native_process_img_Func, Process_img_Func>(
            'process_image');
    Process_img_Func erode_img_func = opencvLib
        .lookupFunction<Native_erode_img_Func, Erode_img_Func>('erodePic');
    String str1 = "/storage/emulated/0/Pictures/index_gray.png";///storage/emulated/0/Pictures/1.png
    String dir = "/storage/emulated/0/Pictures/Screenshots/Screenshot_2023.03.01_22.56.26.880.png"; //await JageFileManager().getAppDirectory();
    String s1 = "";
    String s2 = "";
    Pointer<Int8> na = str1.toNativeUtf8().cast<Int8>();
    JageFileManager().getLocalFile();
    //保存网络图片
    String networkImg =
        "https://www.baidu.com/img/flexible/logo/pc/index_gray.png"; //http://jage.cktyun.com/1.png
    GallerySaver.saveImage(networkImg).then((success) {
      print("networkImg is saved.");
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("FFI"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Text("OpenCV version: $str"),
            ElevatedButton(
              onPressed: () async {
                print(dir);

                
                final List<AssetEntity>? result = 
                    await AssetPicker.pickAssets(context);
                    String? path = result![0].relativePath;
                    String? title = result[0].title;
                String? thumPic = path! + "/" + title!;
                na = thumPic.toNativeUtf8().cast<Int8>();
                s1 = thumPic;
                s2 = path + "/2.png";
                setState(() {
                  dir = s2;
                });
                print("s1: " + s1);
                print("s2: " + s2);
                process_img_func(na, s1.toNativeUtf8().cast<Int8>());
                erode_img_func(na, s2.toNativeUtf8().cast<Int8>());
              },
              child: Text("opencv"),
            ),
            Image.file(
              File(s2),
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
