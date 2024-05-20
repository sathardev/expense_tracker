import 'package:flutter/material.dart';

import '../data/constants.dart';

final ThemeData themeData = ThemeData(
  dividerTheme:
      const DividerThemeData(color: Color(0x331A213B), thickness: 0.5),
  scaffoldBackgroundColor: bgColor,
  appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
  primaryColor: primaryColor,
  primarySwatch: swatchColor,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: whiteColor,
    secondary: Colors.green,
    onSecondary: whiteColor,
    primaryContainer: orangeColor,
    error: orangeColor,
    onError: whiteColor,
    background: whiteColor,
    onBackground: whiteColor,
    surface: greenColor,
    onSurface: whiteColor,
    surfaceTint: Colors.transparent,
  ),
);

final Map<int, Color> _yellow700Map = {
  50: yellowColor,
  100: yellowColor,
  200: yellowColor,
  300: yellowColor,
  400: yellowColor,
  500: yellowColor,
  600: yellowColor,
  700: yellowColor,
  800: yellowColor,
  900: yellowColor,
};

final MaterialColor swatchColor =
    MaterialColor(yellowColor.value, _yellow700Map);
