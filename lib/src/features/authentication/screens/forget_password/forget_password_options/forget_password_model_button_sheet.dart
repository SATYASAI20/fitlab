import 'package:fit_lab/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class FForgetPasswordBtnScreen {
  static Future<dynamic> buildShowModelButtonSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSize.fDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              fForgetPasswordTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              fForgetPasswordSubTitle,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),

            // This the Email verification btn
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const FForgetPasswordBtnMailScreen());
              },
              btnIcon: Icons.mail_outline_rounded,
              title: fResetViaEmailTitle,
              subTitle: fResetViaEmailSubTitle,
            ),

            const SizedBox(height: 20),
            // This is the Phone Number Verifaction Btn
            ForgetPasswordBtnWidget(
              onTap: () {},
              btnIcon: Icons.mobile_friendly_outlined,
              title: fResetviaPhoneTitle,
              subTitle: fResetViaPhoneSubTitle,
            ),
          ],
        ),
      ),
    );
  }
}
