import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpTextButtonTheme {
  static TextButtonThemeData get themeData => const TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(AppColors.cF12838),
        ),
      );
}
