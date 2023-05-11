import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';


class AlertButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const AlertButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
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