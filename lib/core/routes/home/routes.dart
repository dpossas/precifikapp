import 'package:go_router/go_router.dart';

import '../../../view/home/home_page.dart';

class HomeRoutes {
  static String home = '/home';

  static List<GoRoute> get routes => [
        GoRoute(
          path: home,
          builder: (_, __) {
            return const HomePage();
          },
        ),
      ];
}
