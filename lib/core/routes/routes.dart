import 'package:go_router/go_router.dart';

import 'auth/routes.dart';
import 'change_password/routes.dart';
import 'create_account/routes.dart';
import 'onboarding/routes.dart';
import 'recover_password/routes.dart';

class Routes {
  static List<RouteBase> get allRoutes => [
        ...OnboardingRoutes.routes,
        ...AuthRoutes.routes,
        ...RecoverPasswordRoutes.routes,
        ...ChangePasswordRoutes.routes,
        ...CreateAccountRoutes.routes
      ];
}
