import 'package:flutter/material.dart';


class MainContainer extends StatelessWidget {
  Widget child;
  MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,),
      child: child
    );
  }
}