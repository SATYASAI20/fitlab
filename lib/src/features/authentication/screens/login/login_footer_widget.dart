import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/text_strings.dart';
import '../signup_screen/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Text(
        //   "Or" , 
        //   style: TextStyle(
        //     fontWeight: FontWeight.w600, 
        //   ),
        // ),
        const SizedBox(height:8),

        // googlesigin_image
        // Container(
        //   padding: const EdgeInsets.all(2),
        //   child: SizedBox(
        
        //     width: double.infinity,
        //     child: OutlinedButton.icon(
        //       onPressed: () {},
        //       icon: Image(
        //         image: AssetImage(fGooglelogoImage),
        //         width: 20,
        //       ),
        //       label: const Text(fSignInWithGoogle),
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: AppSize.fformheight - 20,
        // ),

        // bottom don't have account text
        TextButton(
          onPressed: () => Get.to(()=>const SignUpScreen()), 
          child:  Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: fDontHaveAnAccount,
                  style: TextStyle(
                    color: Colors.black87, 
                  ),
                ),
                TextSpan(
                  text: fSign_up.toUpperCase(),
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
