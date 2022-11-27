import 'package:flutter/material.dart';

import '../../../data/globals.dart';
import '../../../models/vertex_model.dart';

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, pointRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Positioned getVertexAsButtonOn2DMap(Vertex vertex) {
  var x = pictureWidth / (vertex.map2DWidth! / vertex.pointX!);
  var y = pictureHeight / (vertex.map2DHeight! / vertex.pointY!);
  return Positioned(
      top: y - pointRadius,
      left: x - pointRadius,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                print("pressed (${vertex.title}) $x , $y");
              },
              child: Container(
                width: pointRadius * 2,
                height: pointRadius * 2,
                child: CustomPaint(
                  foregroundPainter: Circle(),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),)
          )
      )
  );
}