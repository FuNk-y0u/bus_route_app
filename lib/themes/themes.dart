import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white)
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black),
);


