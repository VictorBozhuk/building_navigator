import 'package:flutter/material.dart';

import 'matrix_gesture_detector.dart';

class TransformDetector extends StatelessWidget {
  late ValueNotifier<Matrix4> notifier;
  late Widget child;
  TransformDetector(this.notifier, {super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MatrixGestureDetector(
      onMatrixUpdate: (m, tm, sm, rm) {
        notifier.value = m;
      },
      onScaleStart: () { },
      onScaleEnd: () { },
      child: GestureDetector(onTapUp: (TapUpDetails details) { },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, child) {
            return Transform(
                transform: notifier.value,
                child: this.child
            );
          },
        ),
      ),
    );
  }
}