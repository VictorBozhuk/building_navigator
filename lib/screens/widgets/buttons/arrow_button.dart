import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';

class ArrowButton extends StatelessWidget{
  final Function() onPressed;
  final Widget icon;
  const ArrowButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: icon,
      ),
    );
  }
}