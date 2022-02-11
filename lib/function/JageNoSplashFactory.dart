import 'package:flutter/material.dart';

class _NoInteractiveInkFeature extends InteractiveInkFeature {
  _NoInteractiveInkFeature({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
  }) : super(controller: controller, referenceBox: referenceBox, color: color);

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    // TODO: implement paintFeature
  }

}

class JageNoSplashFactory extends InteractiveInkFeatureFactory {
  @override
  InteractiveInkFeature create({required MaterialInkController controller
  , required RenderBox referenceBox
  , required Offset position
  , required Color color, required TextDirection textDirection
  , bool containedInkWell = false, RectCallback? rectCallback
  , BorderRadius? borderRadius, ShapeBorder? customBorder
  , double? radius, VoidCallback? onRemoved}) {
    // TODO: implement create
    return _NoInteractiveInkFeature(color: color, referenceBox: referenceBox, controller: controller);
  }
  
}