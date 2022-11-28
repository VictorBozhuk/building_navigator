import 'package:flutter/material.dart';
import 'dart:math';

import '../../data/globals.dart';
import '../../models/vertex_model.dart';

Vertex getCreatedVertexOnMap(TapUpDetails details) {
  var x = roundDouble(details.localPosition.dx);
  var y = roundDouble(details.localPosition.dy);
  print("Point:   x = ${x}   y = ${y}");
  return Vertex.createOnlyPoint(x, y, pictureWidth, pictureHeight);
}

double roundDouble(double value){
  num mod = pow(10.0, 2);
  return ((value * mod).round().toDouble() / mod);
}

void setSize(GlobalKey key){
  final box = key.currentContext?.findRenderObject() as RenderBox;
  print("height ${box.size.height}      width ${box.size.width}");

  pictureHeight = box.size.height;
  pictureWidth = box.size.width;
  pointRadius = box.size.width / 55;
}