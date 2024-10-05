import 'package:flutter/material.dart';
import 'package:precificapp/core/consts/app_colors.dart';
import 'package:precificapp/core/extensions/build_context_ext.dart';
import 'package:precificapp/view/auth/components/ep_icon.dart';
import 'package:precificapp/view/components/ep_label.dart';

import '../../core/consts/app_icons.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {},
                    child: const Text('Esqueceu sua senha?'),
                  ),
                ),
                verticalDivider12,
                verticalDivider12,
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
                    onPressed: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final horizontalDivider12 = const SizedBox(width: 12);
}
