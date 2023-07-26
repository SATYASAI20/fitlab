import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:fit_lab/src/features/authentication/controllers/profile_controller.dart';
import 'package:fit_lab/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(ProfileController()); // data is calling from profilecontroller
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.4) ,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: const Text(fEditProfile),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSize.fDefaultSize),
          // 4 => Wrap widget with futureBuilder
          child: FutureBuilder(
              future: controller.getUserData(), //passing the data
              builder: (context, snapshot) {
                // connection checking data is fetched
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data as UserModel;
                     //controllers/update_profile
                    final email = TextEditingController(text: user.email);
                    final password = TextEditingController(text: user.password);
                    final fullName = TextEditingController(text: user.fullName);
                    final phoneNo = TextEditingController(text: user.phoneNo);
                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:
                                    Image(image: AssetImage(fAppImage)),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                // convert to gestiure dectector to be clickable
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: FAppColors.fPrimaryColor,
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullName,
                                // initialValue: userdata.fullName,
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
                                controller: email,
                                // initialValue: userdata.email,
                                decoration: const InputDecoration(
                                  labelText: fSignUpEmail,
                                  prefixIcon: Icon(
                                    Icons.mail_outline_rounded,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              const SizedBox(height: AppSize.fDefaultSize - 20),

                              TextFormField(
                                controller: phoneNo,
                                // initialValue: userdata.phoneNo,
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
                                controller: password,
                                // initialValue: userdata.password,
                                decoration: const InputDecoration(
                                  labelText: fSign_up,
                                  prefixIcon: Icon(
                                    Icons.fingerprint,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: AppSize.fformheight),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                      email: email.text.trim(),
                                      password:password.text.trim(),
                                      fullName:fullName.text.trim(),
                                      phoneNo:phoneNo.text.trim(),
                                    );
                                    return await controller.updateRecord(userData);
                                    // Get.to(() => const UpdateProfileScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: FAppColors.fyellowColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(
                                    fSaveProfile,
                                    style: TextStyle(
                                      color: FAppColors.fDarkColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(height:AppSize.fformheight),
                              // Column(
                              //   children:[
                              //     ElevatedButton(
                              //       onPressed: () {},
                              //       child:const Text(fDelete),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text("Something went Wrong"));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
