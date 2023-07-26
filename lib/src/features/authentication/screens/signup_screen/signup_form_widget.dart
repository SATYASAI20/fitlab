import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lab/src/features/authentication/controllers/signup_controller.dart';
import 'package:fit_lab/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/properties/email.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String password = '';
    String confirmPassword = '';
    final controller = Get.put(
        SignUpController()); // all this data like name, email etc., will be put into signupcontroller
    final formKey = GlobalKey<FormState>(); // unique key id
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSize.fformheight - 20),
      child: Form(
        key: formKey, ////
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                labelText: fFullName,
                // hintText: "Full_Name",
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.fDefaultSize - 20),
            TextFormField(
              controller: controller.email,
              validator: (value) {
                String ex;
                // ignore: unrelated_type_equality_checks
                try {
                  if (value == null || value.isEmpty) {
                    return 'please your enter E-mail';
                  }
                } on FirebaseAuthException catch (_, e) {
                  // return 'Please enter a different email';
                  final String ex = e as String;
                  if (value == ex) {
                    return 'An Account already exists for that email';
                  }
                  return 'An Account already exists for that email';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: fSignUpEmail,
                // hintText: "Email",
                prefixIcon: Icon(
                  Icons.mail_outline_rounded,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.fDefaultSize - 20),
            TextFormField(
              controller: controller.phoneNo,
              validator: (value) {
                // Indian Mobile number are of 10 digit only

                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = RegExp(pattern);
                if (value!.isEmpty || value.length < 10 || value.length > 10) {
                  return 'Please enter a valid number';
                } else if (!regExp.hasMatch(value)) {
                  return 'Please enter valid mobile number';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: fPhoneNo,
                // hintText: "Enter PhoneNumber",
                prefixIcon: Icon(
                  Icons.numbers_outlined,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.fDefaultSize - 20),
            TextFormField(
              controller: controller.password,
              onChanged: (value) {
                //______________________________________________
                password = value;
              },
              validator: (value) {
                RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (value!.isEmpty) {
                  return 'Please enter password';
                } else {
                  if (!regex.hasMatch(value)) {
                    return 'Enter valid password';
                  } else {
                    return null;
                  }
                }
              },
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'please your enter E-mail';
              //   }
              //   return null;
              // },
              decoration: const InputDecoration(
                labelText: fpassword,
                prefixIcon: Icon(
                  Icons.lock,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.fDefaultSize - 20),
            TextFormField(
              // controller: controller.confirmPassword,
              onChanged: (value) {
                //______________________________________________
                confirmPassword = value;
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please Conform password ';
                }
                if (value != password) {
                  return 'Confirm password not matching';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: fConformPassword,
                hintText: "Conform Password",
                prefixIcon: Icon(
                  Icons.lock,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSize.fDefaultSize - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // dynamic currentState;
                  // var formKey;
                  // final isvalidate = _formKey.currentState!.validate();
                  // if (isvalidate==null) {
                  if (formKey.currentState!.validate()) {
                    // for message
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //       content: Text(
                    //     'Processing Data',
                    //   )),
                    // );
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });

                    /// this for signup logic  phoneNumber
                    // SignUpController.instance
                    //     .phoneAuthentication(controller.phoneNo.text.trim());
                    // Get.to(() => const FOTPScreen());

                    // ///
                    // _formKey.currentState!.save();
                    // }else{
                    //email signup
                    //    SignUpController.instance.registerUser(
                    //       controller.email.text.trim(),
                    //       controller.password.text.trim());
                    // firebase ** get user and pass it to controller **
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(fSign_up.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
