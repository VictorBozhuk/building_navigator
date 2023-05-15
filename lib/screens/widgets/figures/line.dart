import 'package:flutter/material.dart';

class Line extends CustomPainter {
  double x1;
  double y1;
  double x2;
  double y2;
  double width;
  Line(this.x1, this.y1, this.x2, this.y2, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(x1, y1);
    final p2 = Offset(x2, y2);
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = width;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}