import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';

class SmallButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  final double width;
  const SmallButton({super.key, required this.title, required this.onPressed, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.buttonColor
        ),
        onPressed: onPressed,
        child: Text(title,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}