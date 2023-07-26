import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FTextFormFieldTheme {
  FTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
    InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: FAppColors.fSecondaryColor,
      floatingLabelStyle: const TextStyle(color: FAppColors.fSecondaryColor),
      focusedBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide:  const BorderSide(width: 2, color: FAppColors.fSecondaryColor),
      ),
    );

  static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)), 
        prefixIconColor: FAppColors.fyellowColor, 
        floatingLabelStyle: const TextStyle(color: FAppColors.fyellowColor), 
        focusedBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(width:2, color: FAppColors.fyellowColor),
        ),
      );
}
