import 'package:flutter/material.dart';

import 'new_switch.dart';

class MainSwitch extends StatelessWidget{
  final Function(bool) onChanged;
  late bool value;
  late String title;
  MainSwitch({super.key, required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(top: 30),
      child:
      NewSwitch(
        title: title,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}