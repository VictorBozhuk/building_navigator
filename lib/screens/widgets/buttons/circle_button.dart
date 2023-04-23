import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget{
  final Function() onPressed;
  final String text;
  const CircleButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35,
        height: 35,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.4),
            shape: BoxShape.circle
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 30),)),
      ),
    );
  }
}