import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class SocialGridImage extends StatefulWidget {
  //list
  late List<AssetEntity> selecedAssets;
  final bool isShow;
  final int picRowNum;

  SocialGridImage(
      {Key? key,
      required this.selecedAssets,
      this.isShow = true,
      this.picRowNum = 3})
      : super(key: key);

  @override
  State<SocialGridImage> createState() => _SocialGridImageState();
}

class _SocialGridImageState extends State<SocialGridImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constarints) {
            final double width =
                (constarints.maxWidth - 5 * (widget.picRowNum + 1)) /
                    widget.picRowNum;

            return Wrap(
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                for (final AssetEntity asset in widget.selecedAssets)
                  _buildGridImage(context, asset, width),
                if (widget.isShow == false) _buildAddIcon(context, width),
              ],
            );
          }),
        ],
      ),
    );
  }

  GestureDetector _buildAddIcon(BuildContext context, double width) {
    
    return GestureDetector(
      onTap: () async {
        final List<AssetEntity>? assets = await AssetPicker.pickAssets(
          context,
          pickerConfig: AssetPickerConfig(
            selectedAssets: widget.selecedAssets,
            maxAssets: 9, //默认最大选取图片数量是 9
          ),
        );
        if (assets!.length > 0) {
          setState(() {
            widget.selecedAssets = assets;
          });
        }
      },
      child: Container(
        color: Colors.black12,
        width: width,
        height: width,
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.black38,
        ),
      ),
    );
  }

  Container _buildGridImage(
      BuildContext context, AssetEntity asset, double width,
      {BoxFit fit = BoxFit.cover}) {
    final AssetEntityImageProvider imageProvider = AssetEntityImageProvider(
        asset,
        isOriginal: false,
        thumbnailSize: ThumbnailSize.square(100));
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Image(
        image: imageProvider,
        width: width,
        height: width,
        fit: fit,
      ),
    );
  }
}
