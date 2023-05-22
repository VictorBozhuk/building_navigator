import 'package:flutter/material.dart';
import 'package:lnu_navigator/providers/areas_provider.dart';
import 'package:lnu_navigator/providers/vertexes_provider.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';
import 'package:lnu_navigator/services/locator.dart';
import 'package:lnu_navigator/styles/appTheme.dart';
import 'package:provider/provider.dart';


class BuildingNavigator extends StatelessWidget {
  const BuildingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AreasProvider(),),
        ChangeNotifierProvider(create: (_) => VertexesProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SplashScreen()
      ),
    );
  }
}