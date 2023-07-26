import 'package:fit_lab/src/common_widgets/form/signup_form_hearder_widget.dart';
import 'package:fit_lab/src/constants/image_strings.dart';
import 'package:fit_lab/src/constants/sizes.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:fit_lab/src/features/authentication/screens/signup_screen/signup_form_widget.dart';
import 'package:flutter/material.dart';


import 'signup_footer_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSize.fDefaultSize),
            child: Column(
              children: [
                // signUp screen header with Image and two text
                SignUpFormHeaderWidget(
                  image: fWelcomeScreenImage,
                  subtitle: fSignUpSubTitle,
                  title: fSignUpTitle,
                  radius: 70,
                ),
                // this is SignUpFormWidget with name,email,phoneNumber and Password
                const SignUpFormWidget(),
                // this the SignUp_footer_Widget with google Logo
                const SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
