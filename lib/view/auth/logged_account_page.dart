import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../services/navigator_service.dart';
import '../components/ep_icon.dart';
import 'components/biometric_permission.dart';
import 'components/ep_app_bar.dart';
import 'components/logged_account_component.dart';

class LoggedAccountPage extends StatefulWidget {
  const LoggedAccountPage({super.key});

  @override
  State<LoggedAccountPage> createState() => _LoggedAccountPageState();
}

class _LoggedAccountPageState extends State<LoggedAccountPage> {
  bool obscureText = true;

  void changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void showBiometricConsent() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: const Dialog(
          child: BiometricPermission(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(NavigatorService.context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EPIcon(
                    context.icon(OutlineIcons.annotation),
                    color: AppColors.cF12838,
                  ),
                  horizontalDivider12,
                  const Text('Precisa de ajuda?'),
                ],
              ),
            ),
          ),
          verticalDivider12,
          verticalDivider12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.maxFinite,
              height: 58,
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () {},
                icon: EPIcon(
                  context.icon(OutlineIcons.mail),
                  color: AppColors.primary250,
                ),
                iconAlignment: IconAlignment.end,
                label: const Text(
                  'Criar uma nova conta',
                  style: TextStyle(
                    color: AppColors.primary250,
                  ),
                ),
              ),
            ),
          ),
        ],
        appBar: const EpAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalDivider12,
                  verticalDivider12,
                  const LoggedAccountComponent(),
                  verticalDivider12,
                  verticalDivider12,
                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        'Trocar conta',
                        style: Theme.of(NavigatorService.context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: AppColors.c1e1e1e,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      icon: EPIcon(
                        context.icon(OutlineIcons.refresh),
                      ),
                    ),
                  ),
                  verticalDivider12,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final horizontalDivider12 = const SizedBox(width: 12);
}
