import 'dart:io';

import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:precificapp/core/validators/fullname_validator.dart';
import 'package:precificapp/core/validators/phone_validator.dart';
import 'package:precificapp/repository/create_account_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ICreateAccountController {
  late RxNotifier<XFile?> profileImage;

  late TextEditingController fullnameController;
  late TextEditingController documentController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController sectorController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  late RxNotifier<bool> agreeTerms;
  late RxNotifier<bool> formIsValid;
  late RxNotifier<bool> obscureText;

  void validateForm();
  void changeObscureText();

  Future<void> selectProfileImage();
  Future<void> createIndividualAccount();
}

class CreateAccountController implements ICreateAccountController {
  final ICreateAccountRepository repository;

  CreateAccountController(this.repository);

  @override
  RxNotifier<XFile?> profileImage = RxNotifier(null);

  @override
  RxNotifier<bool> agreeTerms = RxNotifier(false);

  @override
  RxNotifier<bool> obscureText = RxNotifier(true);

  @override
  RxNotifier<bool> formIsValid = RxNotifier(false);

  @override
  TextEditingController fullnameController = TextEditingController();

  @override
  TextEditingController documentController = TextEditingController();

  @override
  TextEditingController emailController = TextEditingController();

  @override
  TextEditingController phoneController = TextEditingController();

  @override
  TextEditingController sectorController = TextEditingController();

  @override
  TextEditingController passwordController = TextEditingController();

  @override
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void changeObscureText() {
    obscureText.value = !obscureText.value;
  }

  @override
  Future<void> createIndividualAccount() async {
    await repository.createIndividualAccount(
      fullname: fullnameController.text,
      doc: documentController.text,
      email: emailController.text,
      password: passwordController.text,
      type: sectorController.text,
      phone: phoneController.text,
      avatar:
          profileImage.value != null ? File(profileImage.value!.path) : null,
      agreeTerms: agreeTerms.value,
    );
  }

  @override
  Future<void> selectProfileImage() async {
    profileImage.value = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 320,
        maxWidth: 320,
        imageQuality: 75);
  }

  @override
  void validateForm() {
    formIsValid.value =
        FullnameValidator.validate(fullnameController.text) == null &&
            CPFValidator.isValid(documentController.text) &&
            EmailValidator.validate(emailController.text) &&
            PhoneValidator.validate(phoneController.text) == null &&
            sectorController.text.trim().length >= 5 &&
            passwordController.text.length >= 8 &&
            agreeTerms.value;
  }
}
