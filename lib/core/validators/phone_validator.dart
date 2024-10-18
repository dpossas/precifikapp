class PhoneValidator {
  static String? validate(String? phone) {
    if (phone == null || phone.trim().length != 15) {
      return 'Telefone inválido';
    }

    return null;
  }
}
