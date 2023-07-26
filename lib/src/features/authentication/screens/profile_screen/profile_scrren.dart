import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lab/src/constants/colors.dart';
import 'package:fit_lab/src/constants/sizes.dart';
import 'package:fit_lab/src/features/authentication/screens/profile_screen/widgets/profile_menu.dart';
import 'package:fit_lab/src/features/authentication/screens/profile_screen/widgets/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  // final userId = FirebaseAuth.instance.currentUser!.uid;
  // final String documentId;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('Users');
    // FirebaseAuth auth =  FirebaseAuth.instance;
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.4),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: const Text(
          fAppName,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon:
        //           Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        // ]
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(AppSize.fDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage(fAppImage)),
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
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
//

              Text(
                '$fProfileHeading ${user.email}',
                // "${data['Full Name']}",

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '$fProfileSubHeading${user.displayName}',
                style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const UpdateProfileScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FAppColors.fyellowColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    fEditProfile,
                    style: TextStyle(
                      color: FAppColors.fDarkColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              // ProfileMenuWidget(
              //     title: fSetting, icon: LineAwesomeIcons.cog, onPress: () {}),
              // const SizedBox(height: 15),
              // const Divider(),
              // ProfileMenuWidget(
              //     title: fAboutUs, icon: LineAwesomeIcons.info, onPress: () {}),
              // const SizedBox(height: 15),
              // const Divider(),
              // ProfileMenuWidget(
              //     title: ffeedback,
              //     icon: LineAwesomeIcons.alternate_comment,
              //     onPress: () {}),
              // const SizedBox(height: 15),
              // const Divider(),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                textColor: Colors.red,
                onPress: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
