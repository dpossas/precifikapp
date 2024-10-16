import 'package:flutter/material.dart';

import '../../core/consts/app_colors.dart';
import '../../services/navigator_service.dart';

class EPLabel extends StatelessWidget {
  final String labelText;
  final Color? textColor;
  final FontWeight? fontWeight;

  const EPLabel(
    this.labelText, {
    super.key,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        labelText,
        style:
            Theme.of(NavigatorService.context).textTheme.labelLarge?.copyWith(
                  color: textColor ?? AppColors.secondary500,
                  height: 1.6,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontFamily: 'PlusJakartaSans',
                ),
      ),
    );
  }
}
