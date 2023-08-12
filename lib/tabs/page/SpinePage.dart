import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

const String _spineAtlas = 'assets/spine/chibi/chibi-stickers.atlas';
const String _spineSkel = 'assets/spine/chibi/chibi-stickers.skel';

class SpinePage extends StatefulWidget {
  const SpinePage({Key? key}) : super(key: key);

  @override
  State<SpinePage> createState() => _SpinePageState();
}

class _SpinePageState extends State<SpinePage> {
  @override
  Widget build(BuildContext context) {
    // reportLeaks();
    final controller = SpineWidgetController(
      onInitialized: (controller) {
        // controller.animationState.setAnimationByName(0, "shoot", true);
        controller.skeleton.setSkinByName("nate");
        controller.skeleton.setToSetupPose();
        controller.animationState
            .setAnimationByName(0, "emotes/idea", true);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spineboy'),
      ),
      body: SpineWidget.fromAsset(
        _spineAtlas,
        _spineSkel,
        controller,
        boundsProvider: SkinAndAnimationBounds(
            skins: ["spineboy"], animation: "emotes/idea"),
        sizedByBounds: true,
      ),
    );
  }
}
