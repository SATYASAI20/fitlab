import 'package:fit_lab/src/features/user_repository/user_repository.dart';
import 'package:fit_lab/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final userRepo = Get.put(UserRepository()); //instance for  userrepositoy

  //textField Controleller to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //call this function from design & will do the rest
  void registerUser(String email, String password) {
    // here authRepository is calling to createUserAccount
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  ///Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
  ///create user and login  after verification
  void createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const FOTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}




























// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import '../../../repository/authentication_repository/authentication_repository.dart';
// import '../../user_repository/user_repository.dart';
// import '../models/user_model.dart';
// import '../screens/forget_password/forget_password_otp/otp_screen.dart';


// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

//   final userRepo = Get.put(UserRepository()); //instance for  userrepositoy

//   //textField Controleller to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();

//   //call this function from design & will do the rest
//   void registerUser(String email, String password, String phoneNo) {
//     // here authRepository is calling to createUserAccount
//     AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password,phoneNo);
//     // if (error != null) {
//     //   Get.showSnackbar(GetSnackBar(message: error.toString()));
//     // }
//   }


//   ///Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
//   ///create user and login  after verification
//   void createUser(UserModel user) async {
//     await userRepo.createUser(user);
//     // registerUser(user.email, user.password);
//     // phoneAuthentication(user.phoneNo);
//     Get.to(() => const FOTPScreen());
//   }

//   void phoneAuthentication(String phoneNo) {
//     return AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   }
// }
