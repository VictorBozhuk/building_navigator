import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';
import 'package:lnu_navigator/models/user_info.dart';

import '../../../data/globals.dart';
import '../../../models/path_model.dart';
import '../../../models/vertex_model.dart';
import '../../admin/add_vertex_screen.dart';
import '../../area_screen.dart';
import '../../panorama_screen.dart';

void _defaultFunc1() {}

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
  return getVertexAsButton(
    vertex,
    () => {
      AdminInfo.selectedVertex = vertex,
      //print("pressed (${vertex.title}) $x , $y");
      func(),
    },
    () {
      AdminInfo.secondSelectedVertex = vertex;
      func();
    },
    _defaultFunc1,
  );
}

Positioned getSecondVertexAsButtonOnSecondArea(Vertex vertex, BuildContext context) {
  return getVertexAsButton(
    vertex,
    () {
      AdminInfo.selectedVertexOnOtherArea = vertex;
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AddVertexScreen()));
    },
    _defaultFunc1,
    _defaultFunc1,
  );
}

Positioned getVertexAsButtonOn2DMapForUser(Vertex vertex, BuildContext context, Function func) {
  return getVertexAsButton(
    vertex,
    () {
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    (){
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PanoramaScreen(currentVertex: vertex)));
    },
    _defaultFunc1,
  );
}

Positioned getVertexAsButtonOn2DMapForUserWithPath(Vertex vertex, BuildContext context, Function func) {
  return getVertexAsButton(
    vertex,
    () {
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    () {
      if(vertex.areaConnection != null){
        UserInfo.area = UserInfo.building.areas.firstWhere((x) => x.uid == vertex.areaConnection!.uid);
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AreaScreen()));
      }
    },
    (){
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      PathInfo.setNewVertexes(vertex);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PanoramaScreen(currentVertex: PathInfo.currentVertex!, nextVertex: PathInfo.nextVertex,)));
    },
  );
}


Positioned getVertexAsButton(Vertex vertex, Function onTap, Function onLongPress, Function onDoubleTap) {
  var x = pictureWidth / (vertex.map2DWidth! / vertex.pointX!);
  var y = pictureHeight / (vertex.map2DHeight! / vertex.pointY!);
  MaterialColor color = Colors.red;
  if(vertex.isFullInfo()){
    color = Colors.blue;
  }
  if(vertex.areaConnection != null){
    color = Colors.yellow;
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
              onDoubleTap: () { onDoubleTap(); },
              onTap: () { onTap(); },
              onLongPress: () { onLongPress(); },
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
