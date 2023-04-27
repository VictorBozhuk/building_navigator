

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../navigation/app_router.gr.dart';
import 'database.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final getIt = GetIt.I;
final appRouter = AppRouter(navigatorKey);

Future<void> setupServiceLocator() async {
  //final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<AppRouter>(appRouter);
  getIt.registerSingleton<DatabaseService>(DatabaseService());

}