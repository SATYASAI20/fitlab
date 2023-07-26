import 'package:fit_lab/src/utils/theme/elevated_button_theme.dart';
import 'package:fit_lab/src/utils/theme/text_field_theme.dart';

import 'package:flutter/material.dart';
import '../theme/outlined_button_theme.dart';

class FAppTheme {
  // static final colors = FAppColors();
  FAppTheme._(); //constractor pravite
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    outlinedButtonTheme: FOutlinedButtonTheme.lightOutlineddButtonTheme,
    elevatedButtonTheme: FElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: FTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    outlinedButtonTheme: FOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: FElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: FTextFormFieldTheme.darkInputDecorationTheme,
    
  );
}

