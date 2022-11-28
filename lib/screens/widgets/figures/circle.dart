import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';

import '../../../data/globals.dart';
import '../../../models/vertex_model.dart';

class Circle extends CustomPainter {
  late MaterialColor color;
  Circle(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, pointRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Positioned getVertexAsButtonOn2DMap(Vertex vertex, Function func) {
  var x = pictureWidth / (vertex.map2DWidth! / vertex.pointX!);
  var y = pictureHeight / (vertex.map2DHeight! / vertex.pointY!);
  MaterialColor color = Colors.red;
  if(vertex.isFullInfo()){
    color = Colors.blue;
  }

  return Positioned(
      top: y - pointRadius,
      left: x - pointRadius,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                if(AdminInfo.selectedVertex == null){
                  AdminInfo.selectedVertex = vertex;
                  // вивети якусь функцію напис що виділено
                  var t = 0;
                }
                else {
                  AdminInfo.secondSelectedVertex = vertex;
                  // вивети якусь функцію напис що виділено
                  var t = 0;
                }
                print("pressed (${vertex.title}) $x , $y");
                func();
              },
              child: Container(
                width: pointRadius * 2,
                height: pointRadius * 2,
                child: CustomPaint(
                  foregroundPainter: Circle(color),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),)
          )
      )
  );
}