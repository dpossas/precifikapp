import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: EPTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: Routes.allRotues,
      ),
    );
  }
}
