import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/widgets/indicators/indicator.dart';

class Navi {
  static void pushReplacement(BuildContext context, PageRouteInfo route){
    context.router.replace(route);
  }

  static void popAndPushReplacement(BuildContext context, PageRouteInfo route){
    int i = 0;
    context.router.popUntil((_) => i++ >= 2);
    //context.router.replace(route);
    context.router.push(route);
  }

  static void push(BuildContext context, PageRouteInfo route){
    context.router.push(route);
  }

  static void popAndPush(BuildContext context, PageRouteInfo route){
    context.router.pop();
    context.router.push(route);
  }

  static void pushThenAction(BuildContext context, PageRouteInfo route, {required Function() action}){
    context.router.push(route).then((_) => action());
  }

  static void pushThenFutureAction(BuildContext context, PageRouteInfo route, {required Future Function() action}){
    context.router.push(route).then((_) => action());
  }

  static void pop(BuildContext context){
    context.router.pop();
  }

  static void popAlert(BuildContext context){
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void popShowDialog(BuildContext context){
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Future<void> showIndicator({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return const Indicator();
        });
  }
}