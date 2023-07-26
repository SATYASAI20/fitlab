import 'package:fit_lab/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:fit_lab/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:fit_lab/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:fit_lab/src/constants/image_strings.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:fit_lab/src/features/authentication/screens/login/login_screen.dart';
import 'package:fit_lab/src/features/authentication/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// final navigatorKey = GlobalKey<NavigatiorState>();


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // navigatorKey:navigatorKey;
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    // var brightness = mediaQuery.platformBrightness;
    // final isdark = brightness==ThemeMode.dark;
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    return Scaffold(
      // light and darkmode
      //   backgroundColor: _isdark? ThemeData.light(
      //   primaryColor: FAppColors.fDarkColor,
      // accentColor: FAppColors.fdeepGreen,
      // focusColor: FAppColors.fdeeppurle,
      // ),
      backgroundColor: Colors.yellow,

      body: Stack(
        children: [
          FFadeInAnimation(
            //Welcome Screen animation using FFadeInAnimation
            durationInMs: 1200,
            animate: FAnimatePosition(
              // ttop: 100,
              tbottom: 100,
              // lleft: 0,
              // lmiddle: 0,
              // rmiddle: 0,
              // rright: 0,
              // bbottom: 0,
              // btop: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: Image(
                  //     image: AssetImage(
                  //       fWelcomeScreenImage,
                  //     ),
                  //     height: height * 0.6,
                  //   ),
                  // ),
                  Hero(
                    tag: 'Welcome to fitLab..!',
                    child: Container(
                      height: height * 0.5,
                      // width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(fWelcomeScreenImage),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // child: Image(
                    //   image: AssetImage(fWelcomeScreenImage

                    //   ),

                    //   height: height * 0.6,
                    // ),
                  ),
                  Column(
                    children: const [
                      Text(
                        fWelcomeTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        fWelcomeSubTitle,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton(
                          // onPressed: () => Get.to(()=> const LoginScreen()),  // loginbtn to loginScreen
                          onPressed: () => Get.to(() => const LoginScreen()),

                          child: Text(
                            flogin.toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => const SignUpScreen()),
                          child: Text(
                            fSign_up.toUpperCase(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // _lightTheme() {
  //   FAppColors.fDarkColor;
  //   FAppColors.fdeepGreen;
  //   FAppColors.fdeeppurle;
  // }

  // _darkTheme() {
  //   const Color.fromARGB(255, 124, 133, 237);
  // }
}
