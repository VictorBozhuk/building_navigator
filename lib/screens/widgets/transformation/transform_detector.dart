import 'package:flutter/material.dart';

import '../../../models/helper/transform_details.dart';
import '../../actions/actions.dart';
import 'matrix_gesture_detector.dart';

class TransformDetector extends StatelessWidget {
  late ValueNotifier<Matrix4> notifier;
  late Widget child;
  late bool shouldRotate;
  late Future Function(TapUpDetails details) onTap;
  late TransformDetails transformDetails;
  TransformDetector(this.notifier, {super.key, required this.child, required this.onTap, required this.transformDetails, this.shouldRotate = true});

  @override
  Widget build(BuildContext context) {
    return MatrixGestureDetector(
      shouldRotate: shouldRotate,
      onMatrixUpdate: (m, tm, sm, rm) {
        notifier.value = m;



        var x_ = notifier.value.entry(0, 3);
        var y_ = notifier.value.entry(1, 3);
        var s_ = notifier.value.entry(0, 0);



        var rX = roundDouble(x_);
        var rY = roundDouble(y_);
        var rS = roundDouble(s_);
        transformDetails.set(rX, rY, rS);
        //print("coords:   x = $rX y = $rY s = $rS");
      },
      onScaleStart: () { },
      onScaleEnd: () { },
      child: GestureDetector(onTapUp: onTap,
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