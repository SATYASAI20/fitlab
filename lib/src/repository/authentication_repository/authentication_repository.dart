import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lab/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:fit_lab/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:fit_lab/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import 'package:fit_lab/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/screens/login/login_screen.dart';
import '../../features/user_repository/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final userRepo = Get.put(UserRepository()); //instance for  userrepositoy
  // variables
  final _auth = FirebaseAuth.instance; // firebase auth
  late final Rx<User?>
      firebaseUser; // after initiallizing in the OnReady function
  var verificationId = ''.obs; // observable RXString so value

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 7));
    firebaseUser = Rx<User?>(_auth.currentUser); // initilaze fb user
    StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        if (snapshot.hasError) {
          return const Center(
              child: Text('Something went wrong.try again later..!'));
        } else if (snapshot.hasData) {
          return const LoginScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
    firebaseUser.bindStream(
      _auth.userChanges(),
      // inform and fb will perform action
    );
    ever(firebaseUser, _setInitialScreen); //always ready
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomeScreen()); //
  }

  //Funtion for  phone number  verification
  void phoneAuthentication(String phoneNo) async {
    // String number = (phoneNo).split('+91');
    // await will wait for firebase data
    await _auth.verifyPhoneNumber(

        //phone Number is passed
        phoneNumber: '+91${phoneNo.toString().trim()}',
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(
              credential); //after complete verification signwithcredentials
        }, //credentials were  entered or if same device automatically executed

        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        }, // verification will be sent

        codeAutoRetrievalTimeout: ((verificationId) {
          this.verificationId.value = verificationId; //
        }),

        // rules validation
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is invalid.');
            // wrong_phone_number();
          } else {
            Get.snackbar('Error', 'Something went Wrong. Try again');
          }
        } // exceptions were handled
        );
  }

  // otp verification will be done here   ///
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  // void weak_password(){

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text('The provided phone number is invalid!'),
  //       );
  //     },
  //   );

  // }

  // create accaount with email and password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // validating the firebase with details for login else welcomescreen
      firebaseUser.value != null
          ? Get.offAll(() => const OnBoardingScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // if (e.code == 'weak-password') {
      //   // weak_password();
      // }
      
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION - ${ex.message}');
        throw ex;
      }
    } catch (_) {
      const SignUpWithEmailAndPasswordFailure();
      // const ex = SignUpWithEmailAndPasswordFailure();
      // if (kDebugMode) {
      //   print('EXCEPTION - ${ex.message}');
      //   throw ex;
      // }
    }
  }

  // // // login with email and password
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    // FirebaseAuth _auth = FirebaseAuth.instance;
    // User? firebaseuser;
    // StreamBuilder<User?>(

    // ),
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // firebaseUser = userCredential.user;
      // ignore: empty_catches, unused_catch_clause
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print("No User found for that email");
        }
      }
    } catch (_) {}
  }

  // signout
  Future<void> logout() async => await _auth.signOut();
}
// StreamBuilder<User?>(
//                             stream: FirebaseAuth.instance.authStateChanges(),
//                             builder:
//                                 (BuildContext context, AsyncSnapshot snapshot) {
//                               // return Container(
//                               //   child: ,
//                               // );
//                               if (snapshot.hasData) {
//                                 return const LoginScreen();
//                               } else {
//                                 return const HomeScreen();
//                               }
//                             },
//                           ),





























// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//   final userRepo = Get.put(UserRepository()); //instance for  userrepositoy
//   // variables
//   final _auth = FirebaseAuth.instance; // firebase auth
//   late final Rx<User?>
//       firebaseUser; // after initiallizing in the OnReady function
//   var verificationId = ''.obs; // observable RXString so value

//   @override
//   void onReady() {
//     Future.delayed(const Duration(seconds: 7));
//     firebaseUser = Rx<User?>(_auth.currentUser); // initilaze fb user
//     StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         // if (snapshot.connectionState == ConnectionState.waiting) {
//         //   return const Center(child: CircularProgressIndicator());
//         // }
//         if (snapshot.hasError) {
//           return const Center(
//               child: Text('Something went wrong.try again later..!'));
//         } else if (snapshot.hasData) {
//           return const LoginScreen();
//         } else {
//           return const HomeScreen();
//         }
//       },
//     );
//     firebaseUser.bindStream(
//       _auth.userChanges(),
//       // inform and fb will perform action
//     );
//     ever(firebaseUser, _setInitialScreen); //always ready
//   }

//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const WelcomeScreen())
//         : Get.offAll(() => const HomeScreen());
//   }

//   //Funtion for  phone number  verification
//   void phoneAuthentication(String phoneNo) async {
//     // String number = (phoneNo).split('+91');
//     // await will wait for firebase data
//     await _auth.verifyPhoneNumber(

//         //phone Number is passed
//         phoneNumber: '+91${phoneNo.toString().trim()}',
//         verificationCompleted: (credential) async {
//           await _auth.signInWithCredential(
//               credential); //after complete verification signwithcredentials
//         }, //credentials were  entered or if same device automatically executed

//         codeSent: (verificationId, resendToken) {
//           this.verificationId.value = verificationId;
//         }, // verification will be sent

//         codeAutoRetrievalTimeout: ((verificationId) {
//           this.verificationId.value = verificationId; //
//         }),

//         // rules validation
//         verificationFailed: (e) {
//           if (e.code == 'invalid-phone-number') {
//             Get.snackbar('Error', 'The provided phone number is not valid.');
//           } else {
//             Get.snackbar('Error', 'Something went Wrong. Try again');
//           }
//         } // exceptions were handled
//         );
//   }

//   // otp verification will be done here   ///
//   Future<bool> verifyOTP(String otp) async {
//     var credentials = await _auth.signInWithCredential(
//         PhoneAuthProvider.credential(
//             verificationId: verificationId.value, smsCode: otp));
//     return credentials.user != null ? true : false;
//   }

//   // create accaount with email and password
//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     // print('123');
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       // print('d');
//       // validating the firebase with details for login else welcomescreen
//       firebaseUser.value != null
//           ? Get.to(
//               () => const OnBoardingScreen())// SignUpController.instance.phoneAuthentication(phoneNo))
//           : Get.to(() => const WelcomeScreen());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       if (kDebugMode) {
//         print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//         throw ex;
//       }
//     } catch (_) {
//       const ex = SignUpWithEmailAndPasswordFailure();
//       if (kDebugMode) {
//         print('EXCEPTION - ${ex.message}');
//         throw ex;
//       }
//     }
//   }

//   // // // login with email and password
//   Future<void> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     // FirebaseAuth _auth = FirebaseAuth.instance;
//     // User? firebaseuser;
//     // StreamBuilder<User?>(

//     // ),
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       // firebaseUser = userCredential.user;
//       // ignore: empty_catches, unused_catch_clause
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         if (kDebugMode) {
//           print("No User found for that email");
//         }
//       }
//     } catch (_) {}
//   }

//   // signout
//   Future<void> logout() async => await _auth.signOut();
// }
// // StreamBuilder<User?>(
// //                             stream: FirebaseAuth.instance.authStateChanges(),
// //                             builder:
// //                                 (BuildContext context, AsyncSnapshot snapshot) {
// //                               // return Container(
// //                               //   child: ,
// //                               // );
// //                               if (snapshot.hasData) {
// //                                 return const LoginScreen();
// //                               } else {
// //                                 return const HomeScreen();
// //                               }
// //                             },
// //                           ),
