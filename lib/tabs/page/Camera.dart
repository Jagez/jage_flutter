import 'dart:async';
import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_player/video_player.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  //第一步、初始化controller
  late CameraController _cameraController;
  // 第二步、初始化设备上的相机。
  late Future<void> _initializeControllerFuture;

  late StreamSubscription<CameraImage> _streamSubscription;

  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;
  bool enableAudio = true;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  late AnimationController _flashModeControlRowAnimationController;
  late Animation<double> _flashModeControlRowAnimation;
  late AnimationController _exposureModeControlRowAnimationController;
  late Animation<double> _exposureModeControlRowAnimation;
  late AnimationController _focusModeControlRowAnimationController;
  late Animation<double> _focusModeControlRowAnimation;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  int _pointers = 0;

  @override
  void initState() {
    super.initState();
    // 将给定对象注册为绑定观察器
    WidgetsBinding.instance.addObserver(this);

    _flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flashModeControlRowAnimation = CurvedAnimation(
      parent: _flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _exposureModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _exposureModeControlRowAnimation = CurvedAnimation(
      parent: _exposureModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
    _focusModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusModeControlRowAnimation = CurvedAnimation(
      parent: _focusModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );

    // 创建CameraController
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.veryHigh, // 分辨率
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _initializeControllerFuture = _cameraController.initialize().then((value) {
      _streamSubscription = _cameraController.startImageStream(
        (image) async{

          final WriteBuffer buffer = WriteBuffer();
          // image.planes.forEach(
          //   (plane) {
          //     buffer.putUint8List(plane.bytes);
          //   }
          // );
          // final Uint8List bytes = buffer.done().buffer.asUint8List();print('out1: ' + bytes.toString());
          // final Uint8List compressedBytes = await FlutterImageCompress.compressWithList(bytes,quality: 100,rotate: 90, minHeight: image.width, minWidth: image.height,);
          // //压缩完成后的数据
          // final base64String = base64Encode(compressedBytes);
          // print('out: ' + base64String);
      }) as StreamSubscription<CameraImage>;  // 转换为StreamSubscription<CameraImage>类型
    });
  }

  Widget _buildCameraPreviewWidget(CameraController controller) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0.5, 0.5),
            child: CameraPreview(controller),
          ),
          Align(
            alignment: Alignment(-1.0, -1.0),
            child: _buildModeBarRowWidget(),
          ),
          Align(
            alignment: Alignment(0.7, 0.7),
            child: _buildCaptureRowWidget(),
          )
        ],
      ),
    );
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _buildModeBarRowWidget() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 闪光灯按钮
          MaterialButton(
            child: const Icon(
              Icons.flash_on,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {
              
              // _cameraController.startImageStream((image) {});
            },
          ),
          //
        ],
      ),
    );
  }

  Widget _buildCaptureRowWidget() {
    return Container(
      width: double.infinity,
      // height: 300.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              if (_cameraController.value.isInitialized &&
                  !_cameraController.value.isRecordingVideo) {
                takePicture().then((XFile? file) {
                  if (mounted) {
                    setState(() {
                      imageFile = file;
                      videoController?.dispose();
                      videoController = null;
                    });

                    if (file != null) {
                      showInSnackBar('picture saved to ${file.path}');
                      print('picture saved to ${file.path}');
                    }
                  }
                });
              }
            },
            child: const Icon(
              Icons.camera,
              size: 100,
              color: Colors.white,
            ),
            // color: Colors.blue,
            shape: const CircleBorder(
              side: BorderSide(
                width: 3.0,
                color: Colors.white,
              ),
            ),
          ),
          // 开始录像按钮
          MaterialButton(
            child: const Icon(
              Icons.videocam,
              size: 100,
              color: Colors.white,
            ),
            shape: CircleBorder(
              side: BorderSide(
                width: 3.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (_cameraController.value.isInitialized &&
                  !_cameraController.value.isRecordingVideo) {
                startVideoRecording().then((_) {
                  if (mounted) {
                    setState(() {});
                  }
                });
              }
            },
          ),
          // 暂停/继续录像
          MaterialButton(
            child: _cameraController.value.isInitialized &&
                    _cameraController.value.isRecordingPaused
                ? const Icon(
                    Icons.play_arrow,
                    size: 100,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.pause,
                    size: 100,
                    color: Colors.white,
                  ),
            onPressed: () {
              if (_cameraController.value.isInitialized &&
                  _cameraController.value.isRecordingVideo &&
                  _cameraController.value.isRecordingPaused) {
                resumeVideoRecording().then((_) {
                  if (mounted) {
                    setState(() {});
                  }
                });
              } else {
                pauseVideoRecording().then((_) {
                  if (mounted) {
                    setState(() {});
                  }
                });
              }
            },
          ),
          // 停止录像按钮
          MaterialButton(
            child: const Icon(
              Icons.stop,
              size: 123,
              color: Colors.red,
            ),
            onPressed: () {
              if (_cameraController.value.isInitialized &&
                  _cameraController.value.isRecordingVideo) {
                stopVideoRecording().then((XFile? file) {
                  if (mounted) {
                    setState(() {});
                  }
                  if (file != null) {
                    print('video saved to ${file.path}');
                    videoFile = file;
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildCameraPreviewWidget(_cameraController);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _flashModeControlRowAnimationController.dispose();
    _exposureModeControlRowAnimationController.dispose();
    //_cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final CameraController? controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCameraController(controller.description);
    }
  }

  Future<void> _initCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      // 分辨率
      kIsWeb
          ? ResolutionPreset.max
          : ResolutionPreset.medium, // kIsWeb判断是否是Web平台运行
      enableAudio: enableAudio, // 是否包含音频
      imageFormatGroup: ImageFormatGroup.jpeg, // 编码为 JPEG 字节的 32 大 RGB 图像
    );
    _cameraController = cameraController;
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      await Future.wait(<Future<Object?>>[
        ...!kIsWeb
            ? <Future<Object?>>[
                cameraController.getMinExposureOffset().then((value) {
                  _minAvailableExposureOffset = value;
                  cameraController.getMaxExposureOffset().then((value) {
                    _maxAvailableExposureOffset = value;
                  });
                  return null;
                })
              ]
            : <Future<Object?>>[],
        cameraController
            .getMaxZoomLevel()
            .then((value) => _maxAvailableZoom = value),
        cameraController
            .getMinZoomLevel()
            .then((value) => _minAvailableZoom = value),
      ]);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('Camera access denied');
          break;
        case 'CameraAccessDeniedWithoutPrompt':
          showInSnackBar('请开启你的APP摄像头权限');
          break;
        case 'CameraAccessRestricted':
          showInSnackBar('Camera access restricted');
          break;
        case 'AudioAccessDenied':
          showInSnackBar('Audio access denied');
          break;
        case 'AudioAccessDeniedWithoutPrompt':
          showInSnackBar('请开启你的APP麦克风权限');
          break;
        case 'AudioAccessRestricted':
          showInSnackBar('Audio access restricted');
          break;
        default:
          print('camera error. code: ${e.code}, desc:${e.description}');
          showInSnackBar(
              'Camera error code: ${e.code}\n desc: ${e.description}');
          break;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) {
      showInSnackBar('Error: Controller is null');
      return null;
    }

    // 等待处理完成
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      final XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      showInSnackBar('Error: ${e.code} ${e.description}');
      return null;
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? controller = _cameraController;
    if (controller == null || !controller.value.isInitialized) {
      showInSnackBar('startVideoRecording Error: Controller is null');
      print('startVideoRecording Error: Controller is null');
      return;
    }

    // 处理已在录制视频
    if (controller.value.isRecordingVideo) {
      return;
    }

    try {
      await controller.startVideoRecording();
      print("start recorded video.");
    } on CameraException catch (e) {
      showInSnackBar('startVideoRecording Error: ${e.code} ${e.description}');
      return;
    }
  }

  Future<XFile?> stopVideoRecording() async {
    final CameraController? controller = _cameraController;
    if (controller == null || !controller.value.isRecordingVideo) {
      showInSnackBar('Error: Controller is null');
      return null;
    }

    try {
      return await controller.stopVideoRecording();
    } on CameraException catch (e) {
      showInSnackBar('stopVideoRecording Error: ${e.code} ${e.description}');
      return null;
    }
  }

  /**
   *  继续录像
   * 
   */
  Future<void> resumeVideoRecording() async {
    final CameraController? controller = _cameraController;
    // 处理已经在录像
    if (controller == null || !controller.value.isRecordingVideo) {
      showInSnackBar('Error: Controller is null');
      return null;
    }

    try {
      await controller.resumeVideoRecording();
      await controller.resumePreview();
      print("resume recorded video.");
    } on CameraException catch (e) {
      showInSnackBar('resumeVideoRecording Error: ${e.code} ${e.description}');
      return;
    }
  }

  Future<void> pauseVideoRecording() async {
    final CameraController? controller = _cameraController;
    // 处理已经在录像
    if (controller == null || !controller.value.isRecordingVideo) {
      return;
    }

    try {
      await controller.pauseVideoRecording();
      await controller.pausePreview();
      print("pause recorded video.");
    } on CameraException catch (e) {
      showInSnackBar('pauseVideoRecording Error: ${e.code} ${e.description}');
      return;
    }
  }
}
