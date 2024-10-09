import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EPIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;

  const EPIcon(
    this.path, {
    super.key,
    this.color,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
