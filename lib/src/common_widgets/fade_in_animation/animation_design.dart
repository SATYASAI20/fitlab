import 'package:fit_lab/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fade_in_animation_model.dart';

class FFadeInAnimation extends StatelessWidget {
  FFadeInAnimation({
    Key? key,
    this.animate,
    required this.child, // three perameters each in splashScreen
    required this.durationInMs,
  }) : super(key: key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final FAnimatePosition? animate;
  final Widget child;
 

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ?  animate!.ttop : animate!.bbottom , //40,-30
        left: controller.animate.value ? animate!.lmiddle:animate!.lleft,
        // bottom: controller.animate.value ?  animate!.btop : animate!. bbottom,
        right: controller.animate.value ? animate!.rmiddle : animate!.rright,
        child:  AnimatedOpacity(
          opacity: controller.animate.value ? 0.8 : 0,
          duration: Duration(milliseconds: durationInMs),
          child: child,
        ),
      ),
    );
  }
}
