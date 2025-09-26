import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_themes.dart/custom_app_bar_theme.dart';
import 'custom_themes.dart/custom_text_theme.dart';

class AppTheme {
  AppTheme._();

  // Light
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Red Hat Display',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.redHatDisplayTextTheme(
      CustomTextTheme.lightTextTheme,
    ),
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );

  // Dark
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Red Hat Display',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.redHatDisplayTextTheme(
      CustomTextTheme.darkTextTheme,
    ),
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
  );
}
