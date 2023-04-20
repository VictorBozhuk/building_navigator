import 'package:flutter/material.dart';


class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).iconTheme.color,)
    );
  }
}