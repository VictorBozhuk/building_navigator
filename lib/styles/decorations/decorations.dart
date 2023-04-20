import 'package:flutter/material.dart';

class MainDecoration {
  static BoxDecoration getListTileDecoration(BuildContext ctx) {
    return BoxDecoration(
        color: Theme.of(ctx).colorScheme.tertiary,
        borderRadius: const BorderRadius.all(Radius.circular(10))
    );
  }
}