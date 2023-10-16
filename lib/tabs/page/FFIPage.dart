import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jage_app/function/JageFileManager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:native_opencv/native_opencv.dart';

// Pointer<Int8> 对应C 的char*
// Dart传参时使用的char*，Utf.toUtf8(String)
typedef Native_Str = Pointer<Int8> Function();
typedef FFI_Str = Pointer<Int8> Function();

// 此处的Void是对应C的void
// void process_image(char* inputImagePath, char* outputImagePath) 
typedef Native_process_img_Func = Void Function(Pointer<Int8>, Pointer<Int8>);
typedef Process_img_Func = void Function(Pointer<Int8>, Pointer<Int8>);

// const char * erodePic(char * inputImagePath, char *outputImagePath)
typedef Native_erode_img_Func = Pointer<Int8> Function(
    Pointer<Int8>, Pointer<Int8>);
typedef Erode_img_Func = Pointer<Int8> Function(Pointer<Int8>, Pointer<Int8>);


class FFIPage extends StatefulWidget {
  FFIPage({Key? key}) : super(key: key);

  @override
  State<FFIPage> createState() => _FFIPageState();
}

class _FFIPageState extends State<FFIPage> {
  //var imageKey = UniqueKey();

  ValueNotifier<UniqueKey> imageKey = ValueNotifier<UniqueKey>(UniqueKey());
  @override
  Widget build(BuildContext context) {
    final DynamicLibrary opencvLib = DynamicLibrary.open("libnative-lib.so");
    FFI_Str verFunc = opencvLib.lookupFunction<Native_Str, FFI_Str>('version');
    //调用C库函数
    Pointer<Int8> result = verFunc();
    String str = result.cast<Utf8>().toDartString();
    print("version: " + str);

    Process_img_Func process_img_func =
        opencvLib.lookupFunction<Native_process_img_Func, Process_img_Func>(
            'process_image');
    Erode_img_Func erode_img_func = opencvLib
        .lookupFunction<Native_erode_img_Func, Erode_img_Func>('erodePic');


    String str1 = "/storage/emulated/0/Pictures/index_gray.png";

    ///storage/emulated/0/Pictures/1.png
    String dir =
        "/storage/emulated/0/Pictures/Screenshots/Screenshot_2023.03.01_22.56.26.880.png"; //await JageFileManager().getAppDirectory();
    String s1 = "";
    String s2 = "";
    JageFileManager().getLocalFile();
    //保存网络图片
    String networkImg =
        "https://www.baidu.com/img/flexible/logo/pc/index_gray.png"; //http://jage.cktyun.com/1.png
    // GallerySaver.saveImage(networkImg).then((success) {
    //   print("networkImg is saved.");
    // });
  //注意不要与setstate同时使用
    ValueNotifier<String> imagePath = ValueNotifier<String>("");
    Pointer<Int8> na = s1.toNativeUtf8().cast<Int8>();
    bool isSelected = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("FFI"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Text("OpenCV version: $str"),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final cacheDir = await getTemporaryDirectory();
                        if (cacheDir.existsSync()) {
                          cacheDir.deleteSync(recursive: true);
                        }
                        final List<AssetEntity>? result =
                            await AssetPicker.pickAssets(context);
                        String? path = result![0].relativePath!;
                        String? title = result[0].title;

                        String? thumPic = path + '/' + title!;
                        print(thumPic);
                        imagePath.value = thumPic;
                        isSelected = true;

                        RegExp regExp = RegExp(r'^.*\/');
                        String tmp = imagePath.value;
                        String? res = regExp.firstMatch(tmp)![0];
                        s2 = (res! + "dnn_img_out.png");

                        String modelFile = await NativeOpencv().getAssetFilePath(
                          "opencv/MobileNetV2SSD/MobileNetSSD_deploy.caffemodel",
                          "opencv/MobileNetV2SSD/MobileNetSSD_deploy.prototxt",
                          imagePath.value, s2);
                        //print("dnn file: ");
                      },
                      child: Text("选择图片"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final cacheDir = await getTemporaryDirectory();
                        if (cacheDir.existsSync()) {
                          cacheDir.deleteSync(recursive: true);
                        }
                        RegExp regExp = RegExp(r'^.*\/');
                        String tmp = imagePath.value;
                        String? res = regExp.firstMatch(tmp)![0];
                        RegExp lastName_regExp = RegExp(r'[^\/]*$');
                        print("res: " + res!);

                        na = tmp.toNativeUtf8().cast<Int8>();
                        s1 = (res+ "process_img_out.png");
                        s2 = (res+ "dnn_img_out.png");
                        print("s1: " + s1);
                        print("s2: " + s2);
                        imagePath.value = s2;
                        imageKey.value = UniqueKey();
                        // process_img_func(na, s1.toNativeUtf8().cast<Int8>());
                        // Pointer<Int8> log = erode_img_func(na, s2.toNativeUtf8().cast<Int8>());
                        // print("result: " + log.cast<Utf8>().toDartString());  //Pointer: address=0x7b7865bb27f7
                        // print("imagePath.value: " + imagePath.value);

                      },
                      child: Text("opencv"),
                    ),
                  ),
                ],
              ),
            ),
            isSelected ? SizedBox() :
            ValueListenableBuilder<String>(
              builder: _buildImage,
              valueListenable: imagePath,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String value1, Widget? child) {
    print("value: " + value1);
    return Container(
      child: Image.file(
        File(value1),
        height: 150,
        key: imageKey.value,
        fit: BoxFit.contain,
      ),
    );
  }
}
