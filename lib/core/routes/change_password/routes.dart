import 'package:go_router/go_router.dart';

import '../../../view/change_password/change_password_page.dart';

class ChangePasswordRoutes {
  static String changePassword = '/newpassword';

  static List<GoRoute> get routes => [
        GoRoute(
          path: changePassword,
          builder: (_, __) => const ChangePasswordPage(),
        ),
      ];
}
