import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'OpenSans',
  scaffoldBackgroundColor: black,
  primaryColor: black,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      fontSize: 14,
      color: black,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: black,
      ),
    ),
  ),
);
