import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';
import 'package:lnu_navigator/services/locator.dart';
import 'package:lnu_navigator/styles/appTheme.dart';

import 'navigation/app_router.gr.dart';
import 'navigation/router_observer.dart';

class BuildingNavigator extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  BuildingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      //home: const SplashScreen()
    );
  }
}