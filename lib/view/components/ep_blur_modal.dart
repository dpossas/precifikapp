import 'dart:ui';

import 'package:flutter/material.dart';

class EPBlurModal extends StatelessWidget {
  final Widget child;

  const EPBlurModal({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        child: child,
      ),
    );
  }
}
