import 'package:flutter/material.dart';
import '../../models/model_on_boarding.dart';

// single page of OnBoarding screen
class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model, // model class contains constractor
  });

  final OnBoardingModel model;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // mainAxisSize: MainAxisSize.max, //use all vertical space
        children: [
          Image(
            // width: 500,
            // height: 350,
            image: AssetImage(model.image), //on_boarding_image
            height: size.height * 0.5,
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              // SizedBox(height: 10),
              Text(
                model.subTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 10, 10, 10),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

