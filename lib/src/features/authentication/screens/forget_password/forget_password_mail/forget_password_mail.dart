import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lab/src/common_widgets/form/signup_form_hearder_widget.dart';
import 'package:fit_lab/src/constants/image_strings.dart';
import 'package:fit_lab/src/constants/sizes.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:flutter/material.dart';


class FForgetPasswordBtnMailScreen extends StatefulWidget {
  const FForgetPasswordBtnMailScreen({Key? key}) : super(key: key);

  @override
  State<FForgetPasswordBtnMailScreen> createState() =>
      _FForgetPasswordBtnMailScreenState();
}

class _FForgetPasswordBtnMailScreenState
    extends State<FForgetPasswordBtnMailScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email!'),
            );
          }
        );
    } on FirebaseAuthException catch (e) {
      // print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var height = size.height;
    // var width = size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSize.fDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: AppSize.fDefaultSize * 3),
                SignUpFormHeaderWidget(
                  image: fForgetPasswordImage,
                  title: fForgetPassword,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  subtitle: fForgetPasswordSubTitle,
                  radius: 80,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: AppSize.fDefaultSize),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text(floginEmail),
                          hintText: floginEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: AppSize.fDefaultSize - 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: passwordReset,
                          child: const Text(fresetpass),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
