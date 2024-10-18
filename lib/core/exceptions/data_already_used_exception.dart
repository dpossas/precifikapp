class DataAlreadyUsedException implements Exception {
  final String message;
  final String title;

  DataAlreadyUsedException({required this.message, required this.title});
}

class InvalidOtpCode implements Exception {
  final String message;
  final String title;

  InvalidOtpCode({required this.message, required this.title});
}
