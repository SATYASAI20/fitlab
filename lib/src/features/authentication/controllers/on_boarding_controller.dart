import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: fOnBoardingImage1,
        title: fOnBoardingTitle1,
        subTitle: fOnBoardingSubTitle1,
        counterText: fOnBoardingCounter1,
        bgColor: FAppColors.fOnBoardingPage1Color,
        // height: size.height, //removed
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: fOnBoardingImage2,
        title: fOnBoardingTitle2,
        subTitle: fOnBoardingSubTitle2,
        counterText: fOnBoardingCounter2,
        bgColor: FAppColors.fOnBoardingPage2Color,
        // height: size.height,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: fOnBoardingImage3,
        title: fOnBoardingTitle3,
        subTitle: fOnBoardingSubTitle3,
        counterText: fOnBoardingCounter3,
        bgColor: FAppColors.fOnBoardingPage3Color,
        // height: size.height,
      ),
    ),
  ];

  //skip function
  skip() => controller.jumpToPage(page: 2);

  //animateToNextSlide function
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  // page change event of botton animation
  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}
