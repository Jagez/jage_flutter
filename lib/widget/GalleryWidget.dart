import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

//图片浏览器
class Gallery extends StatefulWidget {
  const Gallery({Key? key, required this.ids, required this.assets, this.isBar})
      : super(key: key);

  final int ids; //当前索引

  final List<AssetEntity> assets; //图片资源
  final bool? isBar;
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {


  BoxFit fit = BoxFit.contain;

  //是否显示bar
  Widget _buildImageView() {
    return ExtendedImageGesturePageView.builder(
      controller: ExtendedPageController(
        initialPage: widget.ids,
      ),
      itemCount: widget.assets.length,
      itemBuilder: (BuildContext context, int index) {
        var item = widget.assets[index];

        return ExtendedImage(
          image: AssetEntityImageProvider(
            item,
            isOriginal: true,
          ),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (ExtendedImageState state) {
            return GestureConfig(
              minScale: 0.8,
              maxScale: 5.0,
              speed: 1.0,
              cacheGesture: false,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              reverseMousePointerScrollDirection: true,
            );
          },
        );
      },
    );
  }

  Widget _buildMainView() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      onDoubleTap: () {
        //双击放大图片
        setState(() {
          fit = BoxFit.fitHeight;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        ///此处把appbar的高度去掉以全屏显示图片
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          //全屏显示需要把appbar透明化
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildImageView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView();
  }

  Widget _buildImageMinimap(AssetEntity assets, double width) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: AssetEntityImage(
        assets,
        width: width,
        height: width,
        fit: BoxFit.cover,
        isOriginal: false,
      ),
    );
  }
}
