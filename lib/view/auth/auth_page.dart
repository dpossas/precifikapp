import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../controller/auth_controller.dart';
import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../core/injections/injections.dart';
import '../../core/routes/create_account/routes.dart';
import '../../core/routes/home/routes.dart';
import '../../core/routes/recover_password/routes.dart';
import '../../services/navigator_service.dart';
import '../components/ep_blur_modal.dart';
import '../components/ep_icon.dart';
import '../components/ep_label.dart';
import 'components/biometric_permission.dart';
import 'components/ep_app_bar.dart';
import 'components/invalid_credentials_modal.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _authController = di.get<IAuthController>();

  void showBiometricConsent() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const EPBlurModal(
        child: BiometricPermission(),
      ),
    );
  }

  void showInvalidCredentialsError() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const EPBlurModal(
        child: InvalidCredentialsModal(),
      ),
    );
  }

  void toHomePage() {
    context.go(HomeRoutes.home);
  }

  Future<void> login() async {
    _authController.login().catchError((_) {
      showInvalidCredentialsError();
    }).then((_) {
      toHomePage();
    });
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              width: double.maxFinite,
              height: 58,
              child: RxBuilder(builder: (context) {
                return ElevatedButton.icon(
                  onPressed: _authController.formIsValid.value ? login : null,
                  icon: EPIcon(
                    context.icon(OutlineIcons.arrowNarrowRight),
                    color: Colors.white,
                  ),
                  iconAlignment: IconAlignment.end,
                  label: const Text('Entrar'),
                );
              }),
            ),
          ),
          verticalDivider12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              width: double.maxFinite,
              height: 58,
              child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () =>
                    context.push(CreateAccountRoutes.createAccount),
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
          verticalDivider12,
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: RxBuilder(
              builder: (_) => Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalDivider12,
                    verticalDivider12,
                    const EPLabel('E-mail'),
                    TextFormField(
                      controller: _authController.emailController,
                      decoration:
                          const InputDecoration(hintText: 'Insira seu e-mail'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (_) {
                        _authController.validateForm();
                      },
                    ),
                    verticalDivider12,
                    const EPLabel('Senha'),
                    TextFormField(
                      controller: _authController.passwordController,
                      obscureText: _authController.obscureText.value,
                      decoration: InputDecoration(
                        hintText: 'Insira sua senha',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: _authController.changeObscureText,
                            child: EPIcon(
                              context.icon(
                                _authController.obscureText.value
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
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (_) async {
                        if (_authController.formIsValid.value) {
                          login();
                        }
                      },
                      onChanged: (_) {
                        _authController.validateForm();
                      },
                    ),
                    verticalDivider12,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.push(RecoverPasswordRoutes.recoverPassword);
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
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final horizontalDivider12 = const SizedBox(width: 12);
}
