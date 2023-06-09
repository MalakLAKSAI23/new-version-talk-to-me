import 'package:flutter/material.dart';

class Themes {
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    // ignore: deprecated_member_use
    textTheme:const TextTheme(bodyText1: TextStyle(color: Colors.white)),
    brightness: Brightness.dark, // définir le brightness sur light

  );
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light, // définir le brightness sur light
  );
}
