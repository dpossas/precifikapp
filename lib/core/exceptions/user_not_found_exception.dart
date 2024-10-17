class UserNotFound implements Exception {
  final String message;
  final String title;

  UserNotFound({required this.message, required this.title});
}

class InvalidOtpCode implements Exception {
  final String message;
  final String title;

  InvalidOtpCode({required this.message, required this.title});
}
