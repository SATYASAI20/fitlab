import 'package:fit_lab/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

import 'package:fit_lab/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance
        .verifyOTP(otp); //otp isverified or not checking
    return isVerified ? Get.offAll(const OnBoardingScreen()) : Get.back();
  }
}
