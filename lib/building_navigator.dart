import 'package:flutter/material.dart';
import 'package:lnu_navigator/providers/areas_provider.dart';
import 'package:lnu_navigator/providers/buildings_provider.dart';
import 'package:lnu_navigator/providers/vertexes_provider.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';
import 'package:lnu_navigator/services/locator.dart';
import 'package:lnu_navigator/styles/appTheme.dart';
import 'package:provider/provider.dart';

import 'navigation/app_router.gr.dart';
import 'navigation/router_observer.dart';

class BuildingNavigator extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  BuildingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BuildingsProvider(),),
        ChangeNotifierProvider(create: (_) => AreasProvider(),),
        ChangeNotifierProvider(create: (_) => VertexesProvider(),),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routerDelegate: _appRouter.delegate(
          navigatorObservers: () => [
            RouterObserver(),
          ],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        //home: const SplashScreen()
      ),
    );
  }
}