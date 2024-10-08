import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../services/navigator_service.dart';
import '../components/ep_blur_modal.dart';
import '../components/ep_icon.dart';
import '../components/ep_label.dart';
import 'components/recover_password_app_bar.dart';
import 'email_sent_success.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _emailController = TextEditingController();
  bool emailIsValid = false;

  void showSuccessEmailSent() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const EPBlurModal(
        child: EmailSentSuccess(),
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
        appBar: const RecoverPasswordAppBar(),
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
              onPressed: !emailIsValid ? null : showSuccessEmailSent,
              icon: EPIcon(
                context.icon(OutlineIcons.arrowNarrowRight),
                color: Colors.white,
              ),
              iconAlignment: IconAlignment.end,
              label: const Text('Recuperar'),
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
                  const EPLabel('E-mail'),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Insira seu e-mail'),
                    controller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        emailIsValid = EmailValidator.validate(value);
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
