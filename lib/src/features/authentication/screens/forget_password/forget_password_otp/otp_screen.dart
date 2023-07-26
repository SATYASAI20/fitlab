import 'package:fit_lab/src/constants/sizes.dart';
import 'package:fit_lab/src/constants/text_strings.dart';
import 'package:fit_lab/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FOTPScreen extends StatelessWidget {
  const FOTPScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // var otpController = Get.put(OTPController());
    // ignore: prefer_typing_uninitialized_variables
    var otp;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(AppSize.fDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            const Text(
              fOtpSubTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "$fOtpMessage support@FitLab.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
              // showFieldAsBox: false,
              filled: true,
              borderWidth: 4.0,
              textStyle: const TextStyle(
                color: Colors.black,
              ),
              onSubmit: (value) {
                otp = value; //  if error  if onSubmit
                Get.put(OTPController());

                /// if not worked
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.put(OTPController.instance.verifyOTP(otp)); // here will worked
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  fnext,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
