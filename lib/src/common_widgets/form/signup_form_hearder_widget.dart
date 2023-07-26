import 'package:fit_lab/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignUpFormHeaderWidget extends StatelessWidget {
  const SignUpFormHeaderWidget({
    Key? key,
    // required this.size,
    required this.image,
    required this.radius,
    required this.subtitle,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textAlign,
    
    
    
  }) : super(key: key);

  // final Size size;
  final String image, title, subtitle;
  final double radius;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  
  

 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    // var width = size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.2,
          // width: width*0.9,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        // CircleAvatar(
        //   backgroundImage: AssetImage(image),
        //   radius: radius,
        // ),
        // Image(
        //   image: AssetImage(
        //     fWelcomeScreenImage,
        //   ),
        //   height: size.height * 0.2,

        //   // width: size.width * 0.7,
        // ),

        const SizedBox(height: AppSize.fDefaultSize - 14),

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),

        Text(
          subtitle,
          textAlign: textAlign,
          style: const TextStyle(
            // letterSpacing: 1,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
