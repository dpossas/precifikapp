import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../repository/recover_password_repository.dart';

abstract class IRecoverPasswordController {
  late TextEditingController emailController;

  late RxNotifier<bool> formIsValid;

  Future<bool> sendEmail();
  String? emailIsValid(String? email);
  bool validateEmail(String? email);
}

class RecoverPasswordController implements IRecoverPasswordController {
  final IRecoverPasswordRepository repository;

  @override
  TextEditingController emailController = TextEditingController();

  RecoverPasswordController(this.repository);

  @override
  RxNotifier<bool> formIsValid = RxNotifier(false);

  @override
  String? emailIsValid(String? email) {
    if (validateEmail(email)) {
      return null;
    }

    return 'E-mail inválido';
  }

  @override
  bool validateEmail(String? email) {
    formIsValid.value = EmailValidator.validate(email ?? '');
    return EmailValidator.validate(email ?? '');
  }

  @override
  Future<bool> sendEmail() async {
    try {
      await repository.sendEmail(emailController.text);
      return true;
    } catch (_) {
      return false;
    }
  }
}
