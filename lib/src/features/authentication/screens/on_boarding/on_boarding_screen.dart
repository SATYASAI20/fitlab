import 'package:fit_lab/src/constants/colors.dart';
import 'package:fit_lab/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingcontroller = OnBoardingController();
    // container widget is refactor to on_boardingPage stateless_widget ,
    //passing properties  on_boardingpage => model_on_boarding and calling on_boardingPage
    //
    // final pages =[
    //   OnBoardingPageWidget(
    //     model: OnBoardingModel(
    //       image: fOnBoardingImage1,
    //       title: fOnBoardingTitle1,
    //       subTitle: fOnBoardingSubTitle1,
    //       counterText: fOnBoardingCounter1,
    //       bgColor: fOnBoardingPage1Color,
    //       height: size.height,
    //     ),
    //   ),
    //   OnBoardingPageWidget(
    //     model: OnBoardingModel(
    //       image: fOnBoardingImage2,
    //       title: fOnBoardingTitle2,
    //       subTitle: fOnBoardingSubTitle2,
    //       counterText: fOnBoardingCounter2,
    //       bgColor: fOnBoardingPage2Color,
    //       height: size.height,
    //     ),
    //   ),
    //   OnBoardingPageWidget(
    //     model: OnBoardingModel(
    //       image: fOnBoardingImage3,
    //       title: fOnBoardingTitle3,
    //       subTitle: fOnBoardingSubTitle3,
    //       counterText: fOnBoardingCounter3,
    //       bgColor: fOnBoardingPage3Color,
    //       height: size.height,
    //     ),
    //   ),
    // ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // liquid swipe pages after splash screen
          LiquidSwipe(
            // calling pages
            pages: onBoardingcontroller.pages,
            //
            onPageChangeCallback: onBoardingcontroller.onPageChangedCallback,
            liquidController: onBoardingcontroller.controller, //  current page
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 50,
            child: OutlinedButton(
              // change onepage to next_page
              onPressed: () => onBoardingcontroller
                  .animateToNextSlide(), //function in on_boaring_controller
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: FAppColors.fDarkColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: TextButton(
              onPressed: () => onBoardingcontroller.skip(),
              child: const Text(
                "skip",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Get.to(() => const HomeScreen()),
              child: const Text(
                "next",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // smooth animation dots at bottom of screen
          Obx(
            // this is observer(Obx) of onBoadring_controller i.e., obs
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: onBoardingcontroller
                    .currentPage.value, //calling for the current page
                count: 3,
                //it show the bottom AnimatedSmoothIndicator, size and style of the animation
                effect: const WormEffect(
                  activeDotColor: FAppColors.fSecondaryColor,
                  dotHeight: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
