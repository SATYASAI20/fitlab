
import 'package:fit_lab/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:fit_lab/src/constants/image_strings.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // final splashController = Get.put(Controller());

  //  FModeDarkOrLight();// specific page color theme to be implemented
  // @override
  // void initState() {
  //   super.initState();
  //   startAnimation();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 146, 12, 186),
              Color.fromARGB(255, 224, 224, 13),
              Color.fromARGB(255, 129, 109, 136),
              Color(0xff18084B),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Stack(
          children: [
            FFadeInAnimation(
              durationInMs: 3100,
              animate: FAnimatePosition(
                // inner top outerbottom
                ttop: 40,
                tbottom: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Obx(
                  () => Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 3400),
                        // left: 100,
                        // width: 500,
                        top: controller.animate.value ? 40 : 0,
                        // left: 300,
              
                        child: AnimatedOpacity(
                          opacity: controller.animate.value ? 1 : 0,
                          duration: const Duration(milliseconds: 3400),
                          child: Container(
                            width: 50,
                            height: 120,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 246, 142, 4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FFadeInAnimation(
              durationInMs: 3100,
              animate: FAnimatePosition(
                lmiddle: 40,
                lleft: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Row(
                  children: [
                    Obx(
                      () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 3400),
                        top: 100,
                        left: controller.animate.value ? 80 : 0,
                        child: AnimatedOpacity(
                          opacity: controller.animate.value ? 1 : 0,
                          duration: const Duration(milliseconds: 3400),
                          child: const Text(
                            fAppTagLine,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color:Color.fromARGB(255, 12, 61, 238),   
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FFadeInAnimation(
              durationInMs: 3100,
              animate: FAnimatePosition(
                // rmiddle: 120,
                // rright: -30,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Obx(
                      () => AnimatedPositioned(
                        // bottom: 300,
                        // right: controller.animate.value ? 120 : -30,
                        duration: const Duration(milliseconds: 3400),
                        child: AnimatedOpacity(
                          opacity: controller.animate.value ? 1 : 0,
                          duration: const Duration(milliseconds: 3400),
                          child: const Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(fSplashImage),
                              radius: 100,
                              
                            ),
                            // child: Image(
                            //   image: AssetImage(fSplashImage),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FFadeInAnimation(
              durationInMs: 3100,
              animate: FAnimatePosition(
                lmiddle: 150,
                lleft: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:510),
                child: Row(
                  children: [
                    Obx(
                      () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 3400),
                        right: controller.animate.value ? 40 : 0,
                        // top: 200,
                        // left: controller.animate.value
                        //     ? width - 100
                        //     : width - 0, // end,lstart

                        child: Column(
                          children: [
                            AnimatedOpacity(
                              opacity: controller.animate.value ? 1 : 0,
                              duration: const Duration(milliseconds: 3400),
                              child: const Text(
                                fAppName,
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color:Colors.yellowAccent,
                                  //  Color.fromARGB(249, 90, 199, 232),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FFadeInAnimation(
              durationInMs: 3100,
              animate: FAnimatePosition(
                btop: -10,
                bbottom: 50,
                
                
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 300,top: 650),
                child: Column(
                 
                  children: [
                    
                    Obx(
                      () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 3400),
                        // right: 500,
                        bottom: controller.animate.value ? 50 : -10,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 3400),
                          opacity: controller.animate.value ? 1 : 0,
                          child: Container(
                            width: 50,
                            height: 100,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(100),
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 246, 142, 4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // //to start the animation
  // Future startAnimation() async {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   setState(() => animate = true);
  //   //it will wait for 5 sec
  //   await Future.delayed(const Duration(milliseconds: 3400));

  //   // ignore: use_build_context_synchronously
  //   Navigator.pushReplacement<void, void>(
  //     context,
  //     MaterialPageRoute(
  //         builder: (BuildContext context) => const WelcomeScreen()),
  //   );
  // }
}
