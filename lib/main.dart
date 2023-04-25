import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/services/database.dart';
import 'package:lnu_navigator/services/locator.dart';

import 'building_navigator.dart';
import 'loader/loader.dart';

void main() async {
  await initFirebase();
  await setupServiceLocator();
  runApp(const BuildingNavigator());
}

Future initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await DatabaseService.addOrUpdateBuilding(buildings[0]);
  //await DatabaseService.addOrUpdateBuilding(buildings[1]);
  //await DatabaseService.addOrUpdateBuilding(buildings[2]);
}


