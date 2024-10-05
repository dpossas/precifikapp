import 'package:go_router/go_router.dart';

import '../../../view/onboarding/onboarding_page.dart';

class OnboardingRoutes {
  static String onboarding = '/onboarding';

  static List<GoRoute> get routes => [
        GoRoute(
          path: onboarding,
          builder: (_, __) => const OnboardingPage(),
        ),
      ];
}
