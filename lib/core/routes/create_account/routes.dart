import 'package:go_router/go_router.dart';

import '../../../view/create_account/create_account_page.dart';

class CreateAccountRoutes {
  static String createAccount = '/create-account';

  static List<GoRoute> get routes => [
        GoRoute(
          path: createAccount,
          builder: (_, __) => const CreateAccountPage(),
        ),
      ];
}
