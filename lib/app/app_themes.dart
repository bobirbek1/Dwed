import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';

class Appthemes {
  static final primarySwatch = MaterialColor(
    AppColors.BUTTON_BLUE.value,
    const <int, Color>{
      50: AppColors.BUTTON_BLUE,
      100: AppColors.BUTTON_BLUE,
      200: AppColors.BUTTON_BLUE,
      300: AppColors.BUTTON_BLUE,
      400: AppColors.BUTTON_BLUE,
      500: AppColors.BUTTON_BLUE,
      600: AppColors.BUTTON_BLUE,
      700: AppColors.BUTTON_BLUE,
      800: AppColors.BUTTON_BLUE,
      900: AppColors.BUTTON_BLUE,
    },
  );

  static final LIGHT_THEME = ThemeData(
      primarySwatch: primarySwatch,
      scaffoldBackgroundColor: AppColors.WHITE,
      fontFamily: "SF Pro Text");
}
