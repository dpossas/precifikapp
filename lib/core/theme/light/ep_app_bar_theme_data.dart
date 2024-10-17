import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class EpAppBarThemeData {
  static AppBarTheme themeData = const AppBarTheme(
    centerTitle: false,
    color: AppColors.primary250,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSpacing: 8,
    foregroundColor: Colors.white,
  );
}
