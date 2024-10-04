import 'package:flutter/material.dart';

import '../../../core/consts/app_colors.dart';

class Indicator extends StatelessWidget {
  final bool isCurrent;

  const Indicator({
    super.key,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isCurrent ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isCurrent ? AppColors.primary250 : AppColors.cE9E9EA,
        ),
      ),
    );
  }
}
