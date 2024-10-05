import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpInputDecorationTheme {
  static InputDecorationTheme get themeData => InputDecorationTheme(
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          color: AppColors.neutral300,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: AppColors.cE9E9EA,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: AppColors.cE9E9EA,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: AppColors.cE9E9EA,
          ),
        ),
      );
}
