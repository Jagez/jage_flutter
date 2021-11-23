import 'package:flutter/material.dart';
import 'package:jage_app/config.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    buttonColor: kButtonColor,
    scaffoldBackgroundColor: kContextColorLightTheme,
    //appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    //textTheme: GoogleFonts.in,
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}