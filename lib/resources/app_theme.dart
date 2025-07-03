import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodieland/gen/fonts.gen.dart';
import 'package:foodieland/resources/app_colors.dart';

class AppTheme {
  static TextStyle lobsterText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.lobster,
    fontSize: 24.0,
  );

  static TextStyle interBlackText = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.inter,
  );

  static TextStyle interGreyText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
    color: AppColors.lightGrey,
  );

  static TextButtonThemeData? textButtonStyle = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      textStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: FontFamily.inter,
        color: Colors.black
      ),
    ),
  );

  static ThemeData themeData = ThemeData(
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      titleMedium: lobsterText,
      labelMedium: interBlackText,
      labelSmall: interGreyText,
    ),
    textButtonTheme: textButtonStyle,
  );
}
