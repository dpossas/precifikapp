import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:precificapp/services/navigator_service.dart';

import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'flavors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final goRouter = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    routes: Routes.allRoutes,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      theme: EPTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}
