import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFF9FA8DA), // indigo shade 200
    primary: Color(0xFF3949AB),
    secondary: Color(0xFF0277BD),
    tertiary: Color(0xFFD7CCC8),
    onPrimary: Colors.black,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFF263238),
    primary: Color(0xFF455A64),
    secondary: Color(0xFF01579B),
    tertiary: Color(0xFF3F51B5),
    onPrimary: Colors.white,
  ),
);



/*
class AppColors {
  static Color purple = const Color(0xFF5E35B1);
  static Color blue = const Color(0xFF0277BD); -> button 
  static Color navy = const Color(0xFF3949AB); -> appbar,drawer, alert dialog
  static Color brown = const Color(0xFFD7CCC8); -> box untuk task
  static Color grey = const Color(0XFFb0BEC5);
  static Color lowblue = const Color(0xFF9FA8DA); -> scaffold
}
*/