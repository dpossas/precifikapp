import 'package:go_router/go_router.dart';

import '../../../view/auth/auth_page.dart';
import '../../../view/auth/logged_account_page.dart';

class AuthRoutes {
  static String auth = '/auth';
  static String loggedAccountChoose = '/choose-account';

  static List<GoRoute> get routes => [
        GoRoute(
          path: auth,
          builder: (_, __) {
            return const AuthPage();
          },
        ),
        GoRoute(
          path: loggedAccountChoose,
          builder: (_, __) {
            return const LoggedAccountPage();
          },
        ),
      ];
}
