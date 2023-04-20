import 'package:flutter/material.dart';

class MainPadding extends StatelessWidget {
  Widget child;
  double left;
  double top;
  double right;
  double bottom;
  MainPadding({super.key, required this.child, this.left = 10, this.top = 10,
    this.right = 10, this.bottom = 10});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: child
    );
  }
}