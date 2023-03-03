import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class SocialGridImage extends StatefulWidget {
  SocialGridImage({Key? key}) : super(key: key);

  @override
  State<SocialGridImage> createState() => _SocialGridImageState();
}

class _SocialGridImageState extends State<SocialGridImage> {

  //list
  List<AssetEntity> _selecedAssets = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: () async {

            final List<AssetEntity>? list = 
            await AssetPicker.pickAssets(context);
            setState(() {
              _selecedAssets = list!;
            });
          }, 
          child: Text("选择图片")),
          Wrap(
            spacing: 20,
            children: [
              //for (final AssetEntity asset in _selecedAssets) 
                //return Image;
              


              
            ]
          ),
        ],
      ),
    );
  }
}