import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

typedef Native_dnn_Func = Pointer<Int8> Function(Pointer assetManager);
typedef Native_dnn = Pointer<Int8> Function(Pointer assetManager);

// const char * dnnTest(char * modelImagePath, char *configImagePath, char *inputImagePath, char *outputImagePath)
typedef Native_Dnn_Func = Pointer<Int8> Function(
    Pointer<Int8>, Pointer<Int8>, Pointer<Int8>, Pointer<Int8>);
typedef Dnn_Func = Pointer<Int8> Function(Pointer<Int8>, Pointer<Int8>, Pointer<Int8>, Pointer<Int8>);

class NativeOpencv {
  static const MethodChannel _channel = const MethodChannel('native_opencv');

    final DynamicLibrary opencvLib = DynamicLibrary.open("libnative-lib.so");
    late Dnn_Func dnn_func ;
  // static final DynamicLibrary nativeOpencv =
  // DynamicLibrary.open('native_opencv');
  // static final Native_dnn nativeMethod = nativeOpencv.lookup<NativeFunction<Native_dnn_Func>>('dnn').asFunction<Native_dnn>();

  NativeOpencv() {
    dnn_func = opencvLib
        .lookupFunction<Native_Dnn_Func, Dnn_Func>('dnnTest');
  }
  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<String> getAssetFilePath(String modelFile, String configFile
            , String inputImagePath, String outputImagePath) async {
    //Future<String> str;
    try {
      // 将模型文件从Flutter assets复制到本地文件系统
      final Directory directory = await getApplicationDocumentsDirectory();
      final String modelFilePath = '${directory.path}/$modelFile';
      final String configFilePath = '${directory.path}/$configFile';
      final ByteData modelData = await rootBundle.load('assets/$modelFile');
      final ByteData configData = await rootBundle.load('assets/$configFile');
      final List<int> modelBytes = modelData.buffer.asUint8List();
      final List<int> configBytes = configData.buffer.asUint8List();

      File model = File(modelFilePath);
      File config = File(configFilePath);

      print("inputimgpath: " + inputImagePath);
      print("outputImagePath: " + outputImagePath);
      //获取路径
      String fileDirectory = model.parent.path;
      print("file path: " + fileDirectory);
      //创建目录
      Directory(fileDirectory).create(recursive: true);

      await model.writeAsBytes(modelBytes).then((filetemp) {
        print('文件写入成功: ${filetemp.path}');
      }).catchError((onError) {
        print('文件写入失败: $onError');
      });
      await config.writeAsBytes(configBytes).then((filetemp) {
        print('文件写入成功: ${filetemp.path}');
      }).catchError((onError) {
        print('文件写入失败: $onError');
      });
      
      dnn_func(modelFilePath.toNativeUtf8().cast<Int8>(), configFilePath.toNativeUtf8().cast<Int8>()
          ,inputImagePath.toNativeUtf8().cast<Int8>(), outputImagePath.toNativeUtf8().cast<Int8>() );
      final String str = await _channel
          .invokeMethod('getAssetFilePath', {'assetFileName': modelFilePath});
      final String str1 = await _channel
          .invokeMethod('getAssetFilePath', {'assetFileName': configFilePath});

      print("dnn_func");
      //删除本地文件
      await File(modelFilePath).delete();
      await File(configFilePath).delete();

      return str;
    } on PlatformException catch (e) {
      print('Failed to load Caffe model from asset: ${e.message}');
      return "error";
    }
  }
}
