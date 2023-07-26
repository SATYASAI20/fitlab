import 'package:fit_lab/src/constants/image_strings.dart';
import 'package:fit_lab/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.25,
          // width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(fWelcomeScreenImage),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        

        const SizedBox(height: AppSize.fDefaultSize - 10),

        const Text(
          floginTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),

        const Text(
          floginSubTitle,
          style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
