import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FOutlinedButtonTheme {
  FOutlinedButtonTheme._();

  /* -- light theme --*/
  static  final lightOutlineddButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape:  const RoundedRectangleBorder(),
      foregroundColor: FAppColors.fSecondaryColor,
      side:  const BorderSide(color: FAppColors.fSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: 15), 


    ),
  );

  /* -- dark Theme --*/
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        foregroundColor: FAppColors.fDarkColor,
        backgroundColor: FAppColors.fWhiteColor,
        side: const BorderSide(color: FAppColors.fWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: 15), 


      ),
  ); 
}
