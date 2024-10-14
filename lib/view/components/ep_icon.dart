import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EPIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final int? quarterTurns;

  const EPIcon(
    this.path, {
    super.key,
    this.color,
    this.width = 24,
    this.height = 24,
    this.quarterTurns,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns ?? 0,
      child: SvgPicture.asset(
        path,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        width: width,
        height: height,
      ),
    );
  }
}
