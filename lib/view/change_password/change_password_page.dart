import 'package:flutter/material.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../core/validators/password_validator.dart';
import '../../services/navigator_service.dart';
import '../components/ep_blur_modal.dart';
import '../components/ep_icon.dart';
import '../components/password_form.dart';
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
                  PasswordForm(
                    passwordController: _passwordController,
                    passwordConfirmationController:
                        _passwordConfirmationController,
                    passwordValidator: _passwordValidator,
                    onValidate: () {
                      setState(() {});
                    },
                  )
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
