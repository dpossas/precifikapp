class FullnameValidator {
  static String? validate(String? fullname) {
    if (fullname == null ||
        !fullname.contains(' ') ||
        fullname.trim().length < 5) {
      return 'Informe o nome completo';
    }

    return null;
  }
}
