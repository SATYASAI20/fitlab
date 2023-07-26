import 'package:get/get.dart';
import '../../features/authentication/screens/welcome_screen/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  // splashScreenController to fadeInAnimationController
  static FadeInAnimationController get find => Get.find();

  // bool animate = false;
  RxBool animate = false.obs; //abservable

  Future startSplashAnimation() async {//500
    await Future.delayed(const Duration(milliseconds: 500)); // start animation
    animate.value = true;
    await Future.delayed(const Duration(milliseconds:5000)); // revort the animation or goback
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 1500 ));
    //
    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300)); // start animation
    animate.value = true;
  }
}
