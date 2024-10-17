import 'package:flutter/material.dart';

import 'light/ep_app_bar_theme_data.dart';
import 'light/ep_checkbox_theme.dart';
import 'light/ep_dialog_theme.dart';
import 'light/ep_elevated_button_theme_data.dart';
import 'light/ep_input_decoration_theme.dart';
import 'light/ep_scaffold_theme_data.dart';
import 'light/ep_text_button_theme.dart';

class EPTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'WorkSans',
    scaffoldBackgroundColor: EPScaffoldThemeData.scaffoldBackgroundColor,
    elevatedButtonTheme: EpElevatedButtonThemeData.themeData,
    textButtonTheme: EpTextButtonTheme.themeData,
    inputDecorationTheme: EpInputDecorationTheme.themeData,
    dialogTheme: EPDialogTheme.themeData,
    checkboxTheme: EPCheckboxTheme.themeData,
    appBarTheme: EpAppBarThemeData.themeData,
  );
}
