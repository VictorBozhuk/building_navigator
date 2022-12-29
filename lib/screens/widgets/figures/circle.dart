import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';
import 'package:lnu_navigator/models/user_info.dart';

import '../../../data/globals.dart';
import '../../../models/path_model.dart';
import '../../../models/picture_size_model.dart';
import '../../../models/vertex_model.dart';
import '../../admin/add_vertex_screen.dart';
import '../../area_screen.dart';
import '../../panorama_screen.dart';

void _defaultFunc1() {}

class Circle extends CustomPainter {
  late MaterialColor color;
  late double radius;
  Circle(this.color, this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Positioned getVertexAsButtonOn2DMap(Vertex vertex, Function func, PictureSize pictureSize) {
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
    pictureSize
  );
}

Positioned getSecondVertexAsButtonOnSecondArea(Vertex vertex, BuildContext context, PictureSize pictureSize) {
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
    pictureSize
  );
}

Positioned getVertexAsButtonOn2DMapForUser(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize) {
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
    pictureSize
  );
}

Positioned getVertexAsButtonOn2DMapForUserWithPath(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize) {
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
    pictureSize
  );
}


Positioned getVertexAsButton(Vertex vertex, Function onTap, Function onLongPress, Function onDoubleTap, PictureSize pictureSize) {

  var x = (pictureSize.width / (vertex.map2DWidth! / vertex.pointX!)) - pictureSize.getRadius();
  var y = (pictureSize.height / (vertex.map2DHeight! / vertex.pointY!)) - pictureSize.getRadius();
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
      top: y,
      left: x,
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onDoubleTap: () { onDoubleTap(); },
              onTap: () { onTap(); },
              onLongPress: () { onLongPress(); },
              child: SizedBox(
                width: pictureSize.getRadius() * 2,
                height: pictureSize.getRadius() * 2,
                child: CustomPaint(
                  foregroundPainter: Circle(color, pictureSize.getRadius()),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
          )
      )
  );
}
