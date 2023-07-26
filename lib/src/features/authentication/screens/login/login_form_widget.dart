import 'package:fit_lab/src/constants/sizes.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../forget_password/forget_password_options/forget_password_model_button_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  //textField Controleller to get data from TextFields
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();

  //   dispose();
  // }

  // final FirebaseAuth auth;
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context);
    // final controller = Get.put(SignUpController());
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: AppSize.fDefaultSize - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // email Btn
            TextFormField(
              controller: emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: floginEmail,
                  hintText: "Email",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: AppSize.fformheight - 18),
            // Password btn
            TextFormField(
              controller: passwordController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value.length < 8) {
                  return 'Password should be at least 8 characters';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: floginpassword,
                hintText: "Password",
                prefixIcon: Icon(Icons.fingerprint),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: AppSize.fformheight - 25),

            // forgetpassword_Btn
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                // this the forgetPassword container Widget and it contains email and phone verification
                onPressed: () {
                  // this forgetPassword Btn constains details like title, subtitle, two btns(Email(title,subtitle,icon),PhoneNumber(title,subtitle,icon))
                  FForgetPasswordBtnScreen.buildShowModelButtonSheet(context);
                },
                child: const Text(fForgetPassword),
              ),
            ),
            // loginBtn , Untill this is form part
            Container(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => const Center(
                    //     child: CircularProgressIndicator(),
                    //   ),
                    // );
                    if (formKey.currentState!.validate()) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      AuthenticationRepository.instance
                        .loginUserWithEmailAndPassword(
                          emailController.text.trim(),
                          passwordController.text.trim()
                        );

                      // Get.to(() => const HomeScreen());

                      //  StreamBuilder<User?>(
                      //   stream: auth.userChanges(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return const HomeScreen();
                      //     }
                      //     return const WelcomeScreen();
                      //   },
                      // );
                      // _formKey.currentState!.save();
                    }
                    // navigatorKey.currentState!
                    // .popUntil((route) => route.isFirst());
                    // _formKey.currentState!.save();
                  },

                  // onPressed: () => Get.to(()=> const HomeScreen()),
                  child: Text(flogin.toUpperCase()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class loginController extends GetxController {
//   static loginController get instance => Get.pop(String email,String password);

//   //textField Controleller to get data from TextFields

//   final
//   final _formKey = GlobalKey<FormState>();

//   //call this function from design & will do the rest
//   void login(String email, String password) {
//     // here authRepository is calling to createUserAccount
//     AuthenticationRepository.instance
//         .loginUserWithEmailAndPassword(email, password);

//   }
// }
