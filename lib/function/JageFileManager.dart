import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

///  path_provider提供的API
/// 1、
///  getTemporaryDirectory 临时缓存目录，可以清除，该目录为程序私有目录
///  Android对应：getCacheDir
///  iOS对应：     NSCachesDirectory
///
/// 2、getApplicationSupportDirectory 程序支持文件的目录
///  存放不向用户公开的文件，不应该放用户数据文件
///  Android对应：getFilesDir
///  iOS对应：NSApplicationSupportDirectory
///
/// 3、getLibraryDirectory 存放持久性文件，备份文件以及对用户不可见的文件
///  Android：抛出[UnsupportedError]异常
///
/// 4、getApplicationDocumentsDirectory 用户生成的数据或应用程序无法重新创建的数据
///   Android：getDataDirectory，如果要让用户看到数据，请考虑改用[getExternalStorageDirectory]。
///   iOS：NSDocumentDirectory，如果数据不是用户生成的，考虑使用[getApplicationSupportDirectory]。
///
/// 5、getExternalStorageDirectory 应用程序顶级存储目录，Android only
///   Android：getExternalFilesDir(null).
///   iOS：抛出[UnsupportedError]异常
///
/// 6、getExternalCacheDirectories 应用程序外部存储（SD卡）数据的目录，Android only
///   Android：Context.getExternalCacheDirs() 或 Context.getExternalCacheDir()（API 19以下）
///   iOS：抛出[UnsupportedError]异常
///
/// 7、getExternalStorageDirectories 可以存储应用程序特定数据的目录，一般是外部存储目录 Android only
///   Android：Context.getExternalFilesDirs(String type)或Context.getExternalFilesDir(String type)（API 19以下）
///   iOS：抛出[UnsupportedError]异常
///
/// 8、getDownloadsDirectory 下载目录 PC only
///   Android/iOS：抛出[UnsupportedError]异常
///
class JageFileManager {
  Future<File> getLocalFile() async {
    Directory? directory;
    Directory? libarayDir;
    List<Directory>? sdDirectory;
    Directory? appDirectory;
    Directory? downloadDirectory;
    Directory? tempDirectory;
    if (Platform.isWindows) {
      directory = await getApplicationDocumentsDirectory();
      downloadDirectory = await getDownloadsDirectory();
    } else if (Platform.isAndroid) {
      //程序外部存储目录
      //  /storage/emulated/0/Android/data/com.jage.jage_app/files
      directory = await getExternalStorageDirectory();
      sdDirectory = await getExternalStorageDirectories();
      //获取应用程序内部存储目录（Root权限才能查看）
      //  /data/user/0/com.jage.jage_app/files
      appDirectory = await getApplicationSupportDirectory();
      tempDirectory = await getTemporaryDirectory();
    } else if (Platform.isIOS) {
      directory = await getApplicationSupportDirectory();
      libarayDir = await getLibraryDirectory();
      downloadDirectory = await getDownloadsDirectory();
    }

    if (directory == null) {
      throw MissingPlatformDirectoryException("该目录不存在");
    }
    String path = directory.path;
    print(path);
    print("sd: " + sdDirectory.toString());
    print("应用程序目录：" + appDirectory!.path);
    //print("download目录：" + downloadDirectory!.path);
    print("temp: " + tempDirectory!.path);
    final file = new File('$path/1.txt');
    return file;
  }

  /// 获取下载目录，不支持Android和iOS
  /// return Directory
  Future<String> getDownloadDirectory() async {
    var downloadDir = await getDownloadDirectory();

    if (downloadDir == null) {
      throw UnsupportedError("当前操作系统不支持等效路径!");
    }
    //downloadDir.create(recursive: true);
    return downloadDir;
  }

  Future<String> getAppDirectory() async {
    var appDir = await getExternalStorageDirectory();

    if (appDir == null) {
      throw UnsupportedError("当前操作系统不支持等效路径!");
    }
    //downloadDir.create(recursive: true);
    return appDir.path;
  }
}
