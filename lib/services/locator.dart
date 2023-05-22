

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lnu_navigator/services/vertex_service.dart';

import 'area_service.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final getIt = GetIt.I;

Future<void> setupServiceLocator() async {
  //final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<AreaService>(AreaService());
  getIt.registerSingleton<VertexService>(VertexService());

}