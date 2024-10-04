import 'package:flutter/widgets.dart';
import 'package:precificapp/core/consts/app_path.dart';

extension BuildContextExt on BuildContext {
  String icon(String iconName, {bool uniqueInTheme = false}) => [
        AppPath.iconPath,
        if (!uniqueInTheme) 'light/',
        '$iconName.svg',
      ].join();
}
