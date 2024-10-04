import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpElevatedButtonThemeData {
  static ElevatedButtonThemeData themeData = const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primary250),
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
