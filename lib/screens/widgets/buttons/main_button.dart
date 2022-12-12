import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/buttons/component_button.dart';

import 'new_elevated_button.dart';

class MainButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const MainButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 20,
        margin: const EdgeInsets.only(top: 30),
        child: NewElevatedButton(
          title: title,
          onPressed: onPressed,
        )
    );
  }
}

class MainComponentButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const MainComponentButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        child: ComponentButton(
          title: title,
          onPressed: onPressed,
        )
    );
  }
}