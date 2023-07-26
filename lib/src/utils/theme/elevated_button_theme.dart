import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FElevatedButtonTheme extends FAppColors {
  FElevatedButtonTheme._();
  
  /* -- light theme --*/
  static  final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: 
    ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ), 
      foregroundColor: FAppColors.fWhiteColor, 
      backgroundColor: FAppColors.fSecondaryColor,
      side: const BorderSide(color: FAppColors.fSecondaryColor), 
      padding: const EdgeInsets.symmetric(vertical: 15), 
      
    ),

  
  );

  /* -- dark Theme --*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    
    style: 
    ElevatedButton.styleFrom(
      elevation: 15,
      shape: const RoundedRectangleBorder(), 
      foregroundColor: FAppColors.fWhiteColor, 
      backgroundColor: FAppColors.fSecondaryColor,
      side: const BorderSide(color: FAppColors.fWhiteColor), 
      padding: const EdgeInsets.symmetric(vertical: 15), 
    ),
  ); 
}
