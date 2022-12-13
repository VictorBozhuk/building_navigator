import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';
import 'package:lnu_navigator/models/user_info.dart';

import '../../../data/globals.dart';
import '../../../models/path_model.dart';
import '../../../models/vertex_model.dart';
import '../../area_screen.dart';
import '../../panorama_screen.dart';

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
  if(vertex.areaConnection != null){
    color = Colors.yellow;
  }

  return Positioned(
      top: y - pointRadius,
      left: x - pointRadius,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                AdminInfo.selectedVertex = vertex;
                print("pressed (${vertex.title}) $x , $y");
                func();
              },
              onLongPress: (){
                AdminInfo.secondSelectedVertex = vertex;
                func();
              },
              child: SizedBox(
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

Positioned getVertexAsButtonOn2DMapForUser(Vertex vertex, BuildContext context, Function func) {
  var x = pictureWidth / (vertex.map2DWidth! / vertex.pointX!);
  var y = pictureHeight / (vertex.map2DHeight! / vertex.pointY!);
  MaterialColor color = Colors.red;
  if(vertex.isFullInfo()){
    color = Colors.blue;
  }
  if(vertex.uid == AdminInfo.selectedVertex?.uid){
    color = Colors.green;
  }

  return Positioned(
      top: y - pointRadius,
      left: x - pointRadius,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                AdminInfo.selectedVertex = vertex;
                PathInfo.sourceVertex = vertex;
                print("pressed (${vertex.title}) $x , $y");
                func();
              },
              onLongPress: (){
                AdminInfo.selectedVertex = vertex;
                PathInfo.sourceVertex = vertex;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanoramaScreen(currentVertex: vertex)));
              },
              child: SizedBox(
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

Positioned getVertexAsButtonOn2DMapForUserWithPath(Vertex vertex, BuildContext context, Function func) {
  var x = pictureWidth / (vertex.map2DWidth! / vertex.pointX!);
  var y = pictureHeight / (vertex.map2DHeight! / vertex.pointY!);
  MaterialColor color = Colors.red;
  if(vertex.isFullInfo()){
    color = Colors.blue;
  }
  if(vertex.uid == AdminInfo.selectedVertex?.uid){
    color = Colors.green;
  }

  return Positioned(
      top: y - pointRadius,
      left: x - pointRadius,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onDoubleTap: () {
                if(vertex.areaConnection != null){
                  UserInfo.area = UserInfo.building.areas.firstWhere((x) => x.uid == vertex.areaConnection!.uid);
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AreaScreen()));
                }
              },
              onTap: () {
                AdminInfo.selectedVertex = vertex;
                PathInfo.sourceVertex = vertex;
                print("pressed (${vertex.title}) $x , $y");
                func();
              },
              onLongPress: (){
                AdminInfo.selectedVertex = vertex;
                PathInfo.sourceVertex = vertex;
                PathInfo.setNewVertexes(vertex);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PanoramaScreen(currentVertex: PathInfo.currentVertex!, nextVertex: PathInfo.nextVertex,)));
              },
              child: SizedBox(
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