import 'package:go_router/go_router.dart';

import '../../../view/auth/auth_page.dart';

class AuthRoutes {
  static String auth = '/';

  static List<GoRoute> get routes => [
        GoRoute(
          path: auth,
          builder: (_, __) {
            return const AuthPage();
          },
        ),
      ];
}
