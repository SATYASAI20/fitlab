import 'package:fit_lab/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Text(
        //   "Or",
        //   style: TextStyle(
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        const SizedBox(height: 8), 
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     onPressed: () {},
        //     icon: Image(
        //       image: AssetImage(fGooglelogoImage),
        //       width: 20,
        //     ),
        //     label: Text(fSignInWithGoogle.toUpperCase()),
        //   ),
        // ),
        TextButton(
          onPressed: () => Get.to(()=>const LoginScreen()), 
          child:  Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: fAlreadyHaveAnAccount,
                  style: TextStyle(
                    color: Colors.black87, 
                  ),
                ),
                TextSpan(
                  text: flogin.toUpperCase(),
                  style:const  TextStyle(
                    color: Colors.blue, 
                  ),
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
