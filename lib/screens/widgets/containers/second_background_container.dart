import 'package:flutter/material.dart';


class SecondBackgroundContainer extends StatelessWidget {
  Widget child;
  double height;
  SecondBackgroundContainer({super.key, required this.child, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child
    );
  }
}