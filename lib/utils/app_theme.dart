import 'package:flutter/material.dart';
import '../res/constants.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: bgColor,
  fontFamily: 'Raleway',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: txtColor),
    bodyMedium: TextStyle(color: txtColor),
    bodySmall: TextStyle(color: txtColor),
  ),
);
