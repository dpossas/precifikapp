import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../repository/auth_repository.dart';
import '../services/secure_storage_service.dart';

abstract class IAuthController {
  late RxNotifier<bool> formIsValid;
  late RxNotifier<bool> obscureText;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  void validateForm();

  Future<void> login();

  void changeObscureText();
}

class AuthController implements IAuthController {
  final IAuthRepository repository;
  final ISecureStorageService localStorage;

  @override
  TextEditingController emailController = TextEditingController();

  @override
  RxNotifier<bool> obscureText = RxNotifier(true);

  @override
  TextEditingController passwordController = TextEditingController();

  AuthController(
    this.repository,
    this.localStorage,
  );

  @override
  RxNotifier<bool> formIsValid = RxNotifier(false);

  @override
  void validateForm() {
    formIsValid.value = EmailValidator.validate(emailController.text) &&
        passwordController.text.length >= 8;
  }

  @override
  void changeObscureText() {
    obscureText.value = !obscureText.value;
  }

  @override
  Future<void> login() async {
    final user =
        await repository.doLogin(emailController.text, passwordController.text);
    if (user != null) {
      await localStorage.saveUser(user);
    }
  }
}
