import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/widgets/indicators/indicator.dart';

class Navi {
  static void pushReplacement(BuildContext context, Widget screen){
    _hideKeyboard();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
    print('route replaced: ${screen.toStringShort()}');
  }

  static void popAndPushReplacement(BuildContext context, Widget screen){
    _hideKeyboard();
    Navigator.pop(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
    print('route pop and replaced: ${screen.toStringShort()}');
    //int i = 0;
    //context.router.popUntil((_) => i++ >= 2);
  }

  static void push(BuildContext context, Widget screen){
    _hideKeyboard();
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
    print('New route pushed: ${screen.toStringShort()}');
  }

  static void pushThenAction(BuildContext context, Widget screen, {required Function() action}){
    _hideKeyboard();
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen)).then((value) => action());
    print('New route pushed: ${screen.toStringShort()}');
  }

  static void pushThenFutureAction(BuildContext context, Widget screen, {required Future Function() action}){
    _hideKeyboard();
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen)).then((_) async {await action();});
    print('New route pushed: ${screen.toStringShort()}');
  }

  static void pop(BuildContext context){
    _hideKeyboard();
    Navigator.pop(context);
    print('route popped: ${context.widget.toStringShort()}');
  }

  static void popAlert(BuildContext context){
    _hideKeyboard();
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void popShowDialog(BuildContext context){
    _hideKeyboard();
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Future<void> showIndicator({required BuildContext context}) {
    _hideKeyboard();
    return showDialog(
        context: context,
        builder: (context) {
          return const Indicator();
        });
  }

  static void _hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}