// step-2 : user repository to perform data operations

// step-2 : user repository to perform data operations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance; // root

  createUser(UserModel user) async {
    //--
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar("Success", "You account has been created.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    })
    // ignore: body_might_complete_normally_catch_error
    .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);

      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  } // get the userModel and add to firestore database
  // step-2 fetch All users Or User details
  //single record
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
    // update user profile
  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());

  }



}











































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fit_lab/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../repository/authentication_repository/authentication_repository.dart';
// import '../authentication/controllers/signup_controller.dart';
// import '../authentication/models/user_model.dart';

// class UserRepository extends GetxController {
//   static UserRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance; // root

//   createUser(UserModel user) async {
//     //--
//     await _db
//         .collection("Users")
//         .add(user.toJson())
//         .whenComplete(() {
//           Get.snackbar("Success", "You account has been created.",
//               snackPosition: SnackPosition.TOP,
//               backgroundColor: Colors.green.withOpacity(0.1),
//               colorText: Colors.green);
//         })
//         .then((value) => SignUpController.instance
//             .registerUser(user.email, user.password))
//         // ignore: body_might_complete_normally_catch_error
//         .catchError((error, stackTrace) {
//           Get.snackbar("Error", "Something went wrong. Try again",
//               snackPosition: SnackPosition.TOP,
//               backgroundColor: Colors.redAccent.withOpacity(0.1),
//               colorText: Colors.red);

//           if (kDebugMode) {
//             print(error.toString());
//           }
//         });
//   } // get the userModel and add to firestore database

//   // step-2 fetch All users Or User details
//   //single record
//   Future<UserModel> getUserDetails(String email) async {
//     final snapshot =
//         await _db.collection("Users").where("Email", isEqualTo: email).get();
//     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
//     return userData;
//   }

//   // update user profile
//   Future<void> updateUserRecord(UserModel user) async {
//     await _db.collection("Users").doc(user.id).update(user.toJson());
//   }

//   void phoneAuthentication(UserModel phoneNo) {
//     AuthenticationRepository.instance.phoneAuthentication(phoneNo as String);
//   }
// }
