import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/extensions/build_context_ext.dart';

class AppButton extends StatefulWidget {
  final String labelText;
  final double customHorizontalPaddingLabel;
  final TextStyle? customFontStyle;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final VoidCallback? onPressed;
  final bool isSecondary;
  final bool small;
  final ButtonStyle? customStyle;
  final double width;

  const AppButton({
    super.key,
    required this.labelText,
    this.customHorizontalPaddingLabel = 10,
    this.customFontStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.onPressed,
    this.isSecondary = false,
    this.small = false,
    this.customStyle,
    this.width = double.infinity,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: SizedBox(
        width: widget.width != double.infinity ? widget.width : double.infinity,
        height: widget.small ? 30 : 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null)
              SvgPicture.asset(
                context.icon(widget.prefixIcon!),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.customHorizontalPaddingLabel),
              child: Text(
                widget.labelText,
                // style: widget.customFontStyle ??
                //     TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 18,
                //       letterSpacing: 0.02,
                //       color: widget.isSecondary ? Colors.white : null,
                //     ),
              ),
            ),
            if (widget.suffixIcon != null)
              SvgPicture.asset(
                context.icon(widget.suffixIcon!),
              ),
          ],
        ),
      ),
    );
  }
}
