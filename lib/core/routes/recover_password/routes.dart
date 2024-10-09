import 'package:go_router/go_router.dart';

import '../../../view/recover_password/recover_password_page.dart';

class RecoverPasswordRoutes {
  static String recoverPassword = '/recover-password';

  static List<GoRoute> get routes => [
        GoRoute(
          path: recoverPassword,
          builder: (_, __) {
            return const RecoverPasswordPage();
          },
        ),
      ];
}
