import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:tuple/tuple.dart';

import '../../data/globals.dart';
import '../../models/area_model.dart';
import '../../models/picture_size_model.dart';
import '../../models/vertex_model.dart';
import '../widgets/figures/line.dart';

Future<Vertex> getCreatedVertexOnMap(TapUpDetails details, Area area, GlobalKey expanderKey) async {
  var pictureSize = await getPictureSizes(expanderKey, area.imagePath);
  var x = roundDouble(details.localPosition.dx);
  var y = roundDouble(details.localPosition.dy);
  if (kDebugMode) {
    print("Point:   x = $x   y = $y");
  }
  return Vertex.point(area.id, x, y, pictureSize.width, pictureSize.height);
}

double roundDouble(double value){
  num mod = pow(10.0, 2);
  return ((value * mod).round().toDouble() / mod);
}

Future<PictureSize> getPictureSizes(GlobalKey expanderKey, String imagePath) async {
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

  //pictureHeight = resultHeight;
  //pictureWidth = resultWidth;
  //pointRadius = resultWidth / 55;

  return PictureSize(resultHeight, resultWidth);
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

double getLengthByPixels(Vertex? first, Vertex? second, PictureSize pictureSize) {
  if(first == null || second == null){
    return 0;
  }
  double x1 = pictureSize.width / (first.areaWidth! / first.pointX!);
  double y1 = pictureSize.width / (first.areaWidth! / first.pointY!);
  double x2 = pictureSize.width / (second.areaWidth! / second.pointX!);
  double y2 = pictureSize.width / (second.areaWidth! / second.pointY!);

  return roundDouble(sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2)));
}

CustomPaint drawLine(Vertex first, Vertex second, PictureSize pictureSize) {
  double x1 = pictureSize.width / (first.areaWidth! / first.pointX!);
  double y1 = pictureSize.width / (first.areaWidth! / first.pointY!);
  double x2 = pictureSize.width / (second.areaWidth! / second.pointX!);
  double y2 = pictureSize.width / (second.areaWidth! / second.pointY!);
  double xDif = (x1 - x2).abs() / 2;
  double yDif = (y1 - y2).abs() / 2;
  double x2Res = 0;
  double y2Res = 0;
  if(x1 < x2){
    if(y1 < y2){
      x2Res = x1 + xDif;
      y2Res = y1 + yDif;
    }
    else{
      x2Res = x1 + xDif;
      y2Res = y1 - yDif;
    }
  }
  else{
    if(y1 < y2){
      x2Res = x1 - xDif;
      y2Res = y1 + yDif;
    }
    else{
      x2Res = x1 - xDif;
      y2Res = y1 - yDif;
    }
  }

  return CustomPaint(
    foregroundPainter: Line(x1, y1, x2Res, y2Res),
    child: Container(color: Colors.transparent),
  );
}