import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/buttons/component_button.dart';

import '../../../styles/appTheme.dart';

class MainButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const MainButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.buttonColor
        ),
        onPressed: onPressed,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
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

class PositionChangerButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const PositionChangerButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 50,
        child: ComponentButton(
          title: title,
          onPressed: onPressed,
        )
    );
  }
}