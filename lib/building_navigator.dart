import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';
import 'package:lnu_navigator/styles/appTheme.dart';

class BuildingNavigator extends StatelessWidget {
  const BuildingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen()
    );
  }
}