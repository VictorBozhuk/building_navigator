import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';

class ComponentButton extends StatelessWidget{
  final Function() onPressed;
  final String title;
  const ComponentButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title,
          style: textStyleMainNormalText),
    );
  }
}