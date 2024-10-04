import 'package:flutter/material.dart';
import 'package:precificapp/core/theme/light/ep_elevated_button_theme_data.dart';

import 'light/ep_scaffold_theme_data.dart';

class EPTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: EPScaffoldThemeData.scaffoldBackgroundColor,
    elevatedButtonTheme: EpElevatedButtonThemeData.themeData,
  );
}
