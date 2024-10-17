import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:precificapp/core/injections/injections.dart';
import 'package:precificapp/services/navigator_service.dart';

import 'core/routes/routes.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';
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
  void initState() {
    initialize();

    super.initState();
  }

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = [packageInfo.version, packageInfo.buildNumber].join('+');
    F.appVersion = appVersion;

    await Injections.setUp();
  }

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
