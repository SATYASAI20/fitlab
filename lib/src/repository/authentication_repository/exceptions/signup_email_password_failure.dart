

import 'package:flutter/material.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;
  // void wrong_phone_number() {
  //     showDialog(
  //       context: message,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('The provided phone number is invalid!'),
  //         );
  //       },
  //     );
  //   }
  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An UnKnow error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            // 'Please enter a stronger password'
        );

      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Email is not vaild or badly formatted');

      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An Account already exists for that email');

      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}

