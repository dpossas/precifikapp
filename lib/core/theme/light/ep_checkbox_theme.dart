import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EPCheckboxTheme {
  static CheckboxThemeData get themeData => CheckboxThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.5),
        ),
      ),
      side: const BorderSide(
        color: AppColors.cE9E9EA,
        width: 1,
      ),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      checkColor: const WidgetStatePropertyAll(Colors.white),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.c5961FF;
        }

        return Colors.white;
      }));
}
