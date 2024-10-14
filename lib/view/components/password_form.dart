import 'package:flutter/material.dart';
import '../../core/extensions/build_context_ext.dart';
import 'ep_label.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/validators/password_validator.dart';
import 'ep_icon.dart';

class PasswordForm extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final PasswordValidator passwordValidator;
  final Function() onValidate;
  final bool? recoverPassword;

  const PasswordForm({
    super.key,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.passwordValidator,
    required this.onValidate,
    this.recoverPassword = false,
  });

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool obscureText = true;
  bool passwordIsValid = false;

  void changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EPLabel(widget.recoverPassword == true ? 'Nova senha' : 'Senha'),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: widget.recoverPassword == true
                ? 'Insira sua nova senha'
                : 'Sua senha',
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: changeObscureText,
                child: EPIcon(
                  context.icon(
                    obscureText ? OutlineIcons.eye : OutlineIcons.eyeOff,
                  ),
                  color: AppColors.c4F5159,
                ),
              ),
            ),
            suffixIconConstraints: BoxConstraints.tight(
              const Size(40.0, 24.0),
            ),
          ),
          controller: widget.passwordController,
          onChanged: (value) {
            setState(() {
              widget.passwordValidator.validate(value);
              widget.onValidate();
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
              context.icon(widget.passwordController.text.isEmpty ||
                      !widget.passwordValidator.hasUpercaseChar()
                  ? OutlineIcons.minusCircle
                  : OutlineIcons.checkCircle),
              color: widget.passwordController.text.isEmpty
                  ? AppColors.neutral250
                  : (widget.passwordValidator.hasUpercaseChar()
                      ? AppColors.c0D964C
                      : AppColors.cF12838),
            ),
            horizontalDivider12,
            Text(
              '1 caractere maiúsculo',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.passwordController.text.isEmpty
                        ? AppColors.neutral250
                        : (widget.passwordValidator.hasUpercaseChar()
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
              context.icon(widget.passwordController.text.isEmpty ||
                      !widget.passwordValidator.hasNumber()
                  ? OutlineIcons.minusCircle
                  : OutlineIcons.checkCircle),
              color: widget.passwordController.text.isEmpty
                  ? AppColors.neutral250
                  : (widget.passwordValidator.hasNumber()
                      ? AppColors.c0D964C
                      : AppColors.cF12838),
            ),
            horizontalDivider12,
            Text(
              '1 número',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.passwordController.text.isEmpty
                        ? AppColors.neutral250
                        : (widget.passwordValidator.hasNumber()
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
              context.icon(widget.passwordController.text.isEmpty ||
                      !widget.passwordValidator.hasSpecialChar()
                  ? OutlineIcons.minusCircle
                  : OutlineIcons.checkCircle),
              color: widget.passwordController.text.isEmpty
                  ? AppColors.neutral250
                  : (widget.passwordValidator.hasSpecialChar()
                      ? AppColors.c0D964C
                      : AppColors.cF12838),
            ),
            horizontalDivider12,
            Text(
              r'1 símbolo. Ex: ! @ # $ % & * + - / : ; = ? \ |',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.passwordController.text.isEmpty
                        ? AppColors.neutral250
                        : (widget.passwordValidator.hasSpecialChar()
                            ? AppColors.c0D964C
                            : AppColors.cF12838),
                    fontWeight: FontWeight.normal,
                  ),
            )
          ],
        ),
        verticalDivider12,
        const EPLabel('Confirme sua senha'),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: 'Confirme sua senha',
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: changeObscureText,
                child: EPIcon(
                  context.icon(
                    obscureText ? OutlineIcons.eye : OutlineIcons.eyeOff,
                  ),
                  color: AppColors.c4F5159,
                ),
              ),
            ),
            suffixIconConstraints: BoxConstraints.tight(
              const Size(40.0, 24.0),
            ),
          ),
          controller: widget.passwordConfirmationController,
          onChanged: (value) {
            setState(() {
              passwordIsValid = widget.passwordController.text ==
                  widget.passwordConfirmationController.text;
              widget.onValidate();
            });
          },
        ),
      ],
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final horizontalDivider12 = const SizedBox(width: 12);
}
