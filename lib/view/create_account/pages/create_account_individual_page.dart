import 'dart:io';

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../controller/create_account_controller.dart';
import '../../../core/consts/app_colors.dart';
import '../../../core/consts/app_icons.dart';
import '../../../core/exceptions/data_already_used_exception.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../../core/injections/injections.dart';
import '../../../core/masks/cpf_mask_formatter.dart';
import '../../../core/masks/phone_mask_formatter.dart';
import '../../../core/routes/auth/routes.dart';
import '../../../core/validators/fullname_validator.dart';
import '../../../core/validators/password_validator.dart';
import '../../../core/validators/phone_validator.dart';
import '../../components/ep_blur_modal.dart';
import '../../components/ep_icon.dart';
import '../../components/ep_label.dart';
import '../../components/password_form.dart';
import '../components/create_account_error_modal.dart';
import '../components/create_account_success.dart';
import '../components/policy_terms.dart';

class CreateAccountIndividualPage extends StatefulWidget {
  const CreateAccountIndividualPage({super.key});

  @override
  State<CreateAccountIndividualPage> createState() =>
      _CreateAccountIndividualPageState();
}

class _CreateAccountIndividualPageState
    extends State<CreateAccountIndividualPage> {
  final _createAccountController = di.get<ICreateAccountController>();

  final _passwordValidator = PasswordValidator();

  void showCreateAccountError({String? title, String? message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => EPBlurModal(
        child: CreateAccountErrorModal(
          title: title,
          message: message,
        ),
      ),
    );
  }

  void showCreateAccountSuccess() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const EPBlurModal(
        child: CreateAccountSuccess(),
      ),
    );
  }

  Future<void> createAccount() async {
    _createAccountController.createIndividualAccount().then((_) {
      showCreateAccountSuccess();
    }).catchError((error) {
      error as DataAlreadyUsedException;

      showCreateAccountError(title: error.title, message: error.message);
    }, test: (error) => error is DataAlreadyUsedException);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 110,
                  height: 110,
                  child: RxBuilder(builder: (_) {
                    return CircleAvatar(
                      foregroundImage:
                          _createAccountController.profileImage.value != null
                              ? Image.file(
                                  File(_createAccountController
                                      .profileImage.value!.path),
                                ).image
                              : null,
                    );
                  }),
                ),
                verticalDivider12,
                TextButton.icon(
                  icon: EPIcon(
                    context.icon(OutlineIcons.pencilAlt),
                    color: AppColors.c5961FF,
                  ),
                  onPressed: _createAccountController.selectProfileImage,
                  label: const Text(
                    'Adicionar foto',
                    style: TextStyle(color: AppColors.c5961FF),
                  ),
                )
              ],
            ),
          ),
          verticalDivider12,
          const EPLabel('Nome completo'),
          TextFormField(
            controller: _createAccountController.fullnameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            autofillHints: const [AutofillHints.name],
            validator: FullnameValidator.validate,
            decoration: const InputDecoration(
              hintText: 'Seu nome completo',
            ),
            onChanged: (_) => _createAccountController.validateForm(),
          ),
          verticalDivider12,
          const EPLabel('CPF'),
          TextFormField(
            controller: _createAccountController.documentController,
            textInputAction: TextInputAction.next,
            inputFormatters: [CPFMaskFormatter.mask],
            validator: (cpf) {
              if (!CPFValidator.isValid(cpf)) {
                return 'CPF inválido';
              }

              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Seu CPF',
            ),
            onChanged: (_) => _createAccountController.validateForm(),
          ),
          verticalDivider12,
          const EPLabel('E-mail'),
          TextFormField(
            controller: _createAccountController.emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (email) {
              if (!EmailValidator.validate(email ?? '')) {
                return 'E-mail inválido';
              }

              return null;
            },
            decoration: const InputDecoration(
              hintText: 'exemplo@gmail.com',
            ),
            onChanged: (_) => _createAccountController.validateForm(),
          ),
          verticalDivider12,
          const EPLabel('Telefone'),
          TextFormField(
            controller: _createAccountController.phoneController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            autofillHints: const [AutofillHints.telephoneNumber],
            validator: PhoneValidator.validate,
            inputFormatters: [PhoneMaskFormatter.mask],
            decoration: const InputDecoration(
              hintText: 'Seu telefone com DDD',
            ),
            onChanged: (_) => _createAccountController.validateForm(),
          ),
          verticalDivider12,
          const EPLabel('Ramo'),
          TextFormField(
            controller: _createAccountController.sectorController,
            textInputAction: TextInputAction.next,
            validator: (sector) {
              if (sector == null || sector.trim().length < 5) {
                return 'Setor inválido';
              }

              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Ex: Confeiteira',
            ),
            onChanged: (_) => _createAccountController.validateForm(),
          ),
          verticalDivider12,
          PasswordForm(
            passwordController: _createAccountController.passwordController,
            passwordConfirmationController:
                _createAccountController.passwordConfirmationController,
            passwordValidator: _passwordValidator,
            onValidate: () {
              _createAccountController.validateForm();
              setState(() {});
            },
          ),
          verticalDivider12,
          RxBuilder(
            builder: (_) {
              return PolicyTerms(
                selected: _createAccountController.agreeTerms.value,
                onChanged: (value) {
                  _createAccountController.agreeTerms.value = value == true;
                  _createAccountController.validateForm();
                },
              );
            },
          ),
          verticalDivider40,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: RxBuilder(
              builder: (_) => ElevatedButton(
                onPressed: _createAccountController.formIsValid.value
                    ? createAccount
                    : null,
                child: const Text('Cadastrar'),
              ),
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
              onPressed: () {
                context.push(AuthRoutes.auth);
              },
              icon: EPIcon(
                context.icon(OutlineIcons.logout),
                color: AppColors.primary250,
                quarterTurns: 2,
              ),
              label: const Text(
                'Fazer login',
                style: TextStyle(
                  color: AppColors.primary250,
                ),
              ),
              iconAlignment: IconAlignment.end,
            ),
          )
        ],
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final verticalDivider40 = const SizedBox(height: 40);
}
