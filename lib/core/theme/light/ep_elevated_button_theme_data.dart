import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpElevatedButtonThemeData {
  static ElevatedButtonThemeData themeData = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.cE6E6E6;
        }
        return AppColors.primary250;
      }),
      shape: WidgetStateProperty.resolveWith(
        (states) {
          return RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: states.contains(WidgetState.disabled)
                  ? AppColors.cE6E6E6
                  : AppColors.primary250,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(60),
            ),
          );
        },
      ),
      elevation: const WidgetStatePropertyAll(0),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontFamily: 'WorkSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  );
}
