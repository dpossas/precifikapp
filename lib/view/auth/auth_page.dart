import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../core/routes/recover_password/routes.dart';
import '../../services/navigator_service.dart';
import '../components/ep_blur_modal.dart';
import '../components/ep_icon.dart';
import '../components/ep_label.dart';
import 'biometric_permission.dart';
import 'components/ep_app_bar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
      builder: (context) => const EPBlurModal(
        child: BiometricPermission(),
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
        appBar: const EpAppBar(),
        persistentFooterButtons: [
          TextButton(
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
          verticalDivider12,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: ElevatedButton.icon(
              onPressed: showBiometricConsent,
              icon: EPIcon(
                context.icon(OutlineIcons.arrowNarrowRight),
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
              label: const Text('Entrar'),
            ),
          ),
          verticalDivider12,
          SizedBox(
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
          verticalDivider12,
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalDivider12,
                  verticalDivider12,
                  const EPLabel('E-mail'),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Insira seu e-mail'),
                  ),
                  verticalDivider12,
                  const EPLabel('Senha'),
                  TextFormField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: 'Insira sua senha',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: changeObscureText,
                          child: EPIcon(
                            context.icon(
                              obscureText
                                  ? OutlineIcons.eye
                                  : OutlineIcons.eyeOff,
                            ),
                            color: AppColors.c4F5159,
                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints.tight(
                        const Size(40.0, 24.0),
                      ),
                    ),
                  ),
                  verticalDivider12,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go(RecoverPasswordRoutes.recoverPassword);
                      },
                      child: const Text('Esqueceu sua senha?'),
                    ),
                  ),
                  verticalDivider12,
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
