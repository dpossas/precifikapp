class PasswordValidator {
  String _password = '';

  bool hasUpercaseChar() => RegExp(r'[A-Z]').hasMatch(_password);
  bool hasNumber() => RegExp(r'[0-9]').hasMatch(_password);
  bool hasSpecialChar() => RegExp(r'[!@#\$&*~]').hasMatch(_password);

  void validate(String value) {
    _password = value;

    hasUpercaseChar();
    hasNumber();
    hasSpecialChar();
  }

  bool get isValid => hasUpercaseChar() && hasNumber() && hasSpecialChar();
}
