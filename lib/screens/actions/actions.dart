import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import '../../data/globals.dart';
import '../../models/vertex_model.dart';

Vertex getCreatedVertexOnMap(TapUpDetails details) {
  var x = roundDouble(details.localPosition.dx);
  var y = roundDouble(details.localPosition.dy);
  if (kDebugMode) {
    print("Point:   x = $x   y = $y");
  }
  return Vertex.createOnlyPoint(x, y, pictureWidth, pictureHeight);
}

double roundDouble(double value){
  num mod = pow(10.0, 2);
  return ((value * mod).round().toDouble() / mod);
}

void setSize(GlobalKey key){
  final box = key.currentContext?.findRenderObject() as RenderBox;
  if (kDebugMode) {
    print("height ${box.size.height}      width ${box.size.width}");
  }

  pictureHeight = box.size.height;
  pictureWidth = box.size.width;
  pointRadius = box.size.width / 55;
}

Future outputPoints(GlobalKey expanderKey, String imagePath) async {
  var box = expanderKey.currentContext?.findRenderObject() as RenderBox;
  var availableHeight = box.size.height;
  var availableWidth = box.size.width;

  var picture = await _calculateImageDimension(imagePath);
  var resultWidth = availableWidth;
  var coef = picture.width / availableWidth;
  var resultHeight = picture.height / coef;

  if(availableHeight < resultHeight){
    resultHeight = availableHeight;
    coef = picture.height / availableHeight;
    resultWidth = picture.width / coef;
  }

  pictureHeight = resultHeight;
  pictureWidth = resultWidth;
  pointRadius = resultWidth / 55; // see it in different devices
}

Future<Size> _calculateImageDimension(String imagePath) {
  Completer<Size> completer = Completer();
  Image image = Image.network(imagePath);
  image.image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener(
          (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}
