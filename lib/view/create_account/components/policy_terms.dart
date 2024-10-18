import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/consts/app_colors.dart';

class PolicyTerms extends StatefulWidget {
  final bool selected;
  final Function(bool?)? onChanged;

  const PolicyTerms({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<PolicyTerms> createState() => _PolicyTermsState();
}

class _PolicyTermsState extends State<PolicyTerms> {
  bool selected = false;
  final recognizer = TapGestureRecognizer()
    ..onTap = () async {
      final url = Uri.parse('https://erikaprecifica.com.br/Terms');

      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    };

  @override
  void initState() {
    selected = widget.selected;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: selected,
          onChanged: (value) {
            selected = value == true;
            widget.onChanged!(value);
            setState(() {});
          },
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Li e aceito os ',
              style: _grayFontStyle,
              children: [
                TextSpan(
                  text: 'termos de uso e política de privacidade',
                  recognizer: recognizer,
                  style: _grayFontStyle.copyWith(
                    color: AppColors.c5961FF,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  children: [
                    TextSpan(
                      text: ' Erika Precifica',
                      style: _grayFontStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle get _grayFontStyle =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.c4F5159,
            fontWeight: FontWeight.normal,
            height: 1.3,
          );
}
