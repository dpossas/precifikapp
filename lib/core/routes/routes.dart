import 'package:go_router/go_router.dart';
import 'package:precificapp/core/routes/auth/routes.dart';
import 'package:precificapp/core/routes/onboarding/routes.dart';

class Routes {
  static List<RouteBase> get allRotues => [
        ...OnboardingRoutes.routes,
        ...AuthRoutes.routes,
      ];
}
