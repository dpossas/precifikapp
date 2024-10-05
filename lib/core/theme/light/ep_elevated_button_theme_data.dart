import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpElevatedButtonThemeData {
  static ElevatedButtonThemeData themeData = const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary250),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: AppColors.primary250,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(60),
          ),
        ),
      ),
      elevation: WidgetStatePropertyAll(0),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  );
}
