import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';


class CreateButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const CreateButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
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