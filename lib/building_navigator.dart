import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';

class BuildingNavigator extends StatelessWidget {
  const BuildingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash()
    );
  }
}