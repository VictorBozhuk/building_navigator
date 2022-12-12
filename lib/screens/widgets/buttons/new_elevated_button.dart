import 'package:flutter/material.dart';

import '../../../Style/text_styles/text_styles.dart';

class NewElevatedButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const NewElevatedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title,
          style: textStyleMainNormalText),
    );
  }
}