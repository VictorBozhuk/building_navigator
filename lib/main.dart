import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/splash_screen.dart';
import 'package:lnu_navigator/services/database.dart';
import 'package:lnu_navigator/test_panorama.dart';
import 'package:lnu_navigator/test_panorama_admin.dart';

import 'loader/loader.dart';

void main() async {
  await initFirebase();
  runApp(const MyApp());
}

Future initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await DatabaseService.addOrUpdateBuilding(buildings[0]);
  //await DatabaseService.addOrUpdateBuilding(buildings[1]);
  //await DatabaseService.addOrUpdateBuilding(buildings[2]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: TestPanoramaScreen()
        //home: TestAdminParoramaScreen()
        home: Splash()
    );
  }
}
