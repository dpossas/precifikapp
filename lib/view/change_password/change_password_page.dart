import 'package:flutter/material.dart';
import 'package:precificapp/core/validators/password_validator.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../services/navigator_service.dart';
import '../components/ep_blur_modal.dart';
import '../components/ep_icon.dart';
import '../components/ep_label.dart';
import 'change_password_success.dart';
import 'components/change_password_app_bar.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  final _passwordValidator = PasswordValidator();

  bool passwordIsValid = false;
  bool obscureText = true;

  void changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void showChangePasswordSuccess() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const EPBlurModal(
        child: ChangePasswordSuccess(),
      ),
    );
  }

  bool passwordConfirmed() {
    return _passwordController.text == _passwordConfirmationController.text;
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
        appBar: const ChangePasswordAppBar(),
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
              onPressed: !_passwordValidator.isValid || !passwordConfirmed()
                  ? null
                  : showChangePasswordSuccess,
              icon: EPIcon(
                context.icon(OutlineIcons.arrowNarrowRight),
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
              label: const Text('Concluir'),
            ),
          ),
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
                  const EPLabel('Nova'),
                  TextFormField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: 'Insira sua nova senha',
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
                    controller: _passwordController,
                    onChanged: (value) {
                      setState(() {
                        _passwordValidator.validate(value);
                        passwordIsValid = false;
                      });
                    },
                  ),
                  verticalDivider12,
                  const EPLabel(
                    'Sua senha deve conter no mínimo:',
                    textColor: AppColors.neutral250,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      EPIcon(
                        context.icon(_passwordController.text.isEmpty ||
                                !_passwordValidator.hasUpercaseChar()
                            ? OutlineIcons.minusCircle
                            : OutlineIcons.checkCircle),
                        color: _passwordController.text.isEmpty
                            ? AppColors.neutral250
                            : (_passwordValidator.hasUpercaseChar()
                                ? AppColors.c0D964C
                                : AppColors.cF12838),
                      ),
                      horizontalDivider12,
                      Text(
                        '1 caractere maiúsculo',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: _passwordController.text.isEmpty
                                  ? AppColors.neutral250
                                  : (_passwordValidator.hasUpercaseChar()
                                      ? AppColors.c0D964C
                                      : AppColors.cF12838),
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      EPIcon(
                        context.icon(_passwordController.text.isEmpty ||
                                !_passwordValidator.hasNumber()
                            ? OutlineIcons.minusCircle
                            : OutlineIcons.checkCircle),
                        color: _passwordController.text.isEmpty
                            ? AppColors.neutral250
                            : (_passwordValidator.hasNumber()
                                ? AppColors.c0D964C
                                : AppColors.cF12838),
                      ),
                      horizontalDivider12,
                      Text(
                        '1 número',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: _passwordController.text.isEmpty
                                  ? AppColors.neutral250
                                  : (_passwordValidator.hasNumber()
                                      ? AppColors.c0D964C
                                      : AppColors.cF12838),
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      EPIcon(
                        context.icon(_passwordController.text.isEmpty ||
                                !_passwordValidator.hasSpecialChar()
                            ? OutlineIcons.minusCircle
                            : OutlineIcons.checkCircle),
                        color: _passwordController.text.isEmpty
                            ? AppColors.neutral250
                            : (_passwordValidator.hasSpecialChar()
                                ? AppColors.c0D964C
                                : AppColors.cF12838),
                      ),
                      horizontalDivider12,
                      Text(
                        r'1 símbolo. Ex: ! @ # $ % & * + - / : ; = ? \ |',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: _passwordController.text.isEmpty
                                  ? AppColors.neutral250
                                  : (_passwordValidator.hasSpecialChar()
                                      ? AppColors.c0D964C
                                      : AppColors.cF12838),
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                  verticalDivider12,
                  const EPLabel('Confirmar nova senha'),
                  TextFormField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      hintText: 'Confirme sua nova senha',
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
                    controller: _passwordConfirmationController,
                    onChanged: (value) {
                      setState(() {
                        passwordIsValid = _passwordController.text ==
                            _passwordConfirmationController.text;
                      });
                    },
                  ),
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
