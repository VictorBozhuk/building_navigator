import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';
import 'package:lnu_navigator/models/user_info.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';

import '../../../data/globals.dart';
import '../../../models/path_model.dart';
import '../../../models/picture_size_model.dart';
import '../../../models/vertex_model.dart';
import '../../../navigation/navi.dart';
import '../../admin/add_vertex_screen.dart';
import '../../area_screen.dart';
import '../../functions/defaults.dart';
import '../../panorama_screen.dart';

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

Positioned getVertexAsButtonOn2DMap(Vertex vertex, Function func, PictureSize pictureSize, {double radius = 10}) {
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
    defaultFunc,
    pictureSize,
    radius: radius
  );
}

Positioned getSecondVertexAsButtonOnSecondArea(Vertex vertex, BuildContext context, PictureSize pictureSize) {
  return getVertexAsButton(
    vertex,
    () {
      AdminInfo.selectedVertexOnOtherArea = vertex;
      Navi.pop(context);
      Navi.popAndPushReplacement(context, AddVertexRoute());
    },
    defaultFunc,
    defaultFunc,
    pictureSize
  );
}

Positioned getVertexAsButtonOn2DMapForUser(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize, {double radius = 10}) {
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
      Navi.push(context, PanoramaRoute(currentVertex: vertex));
    },
      defaultFunc,
    pictureSize,
    radius: radius
  );
}

Positioned getVertexAsButtonOn2DMapForUserWithPath(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize, {double radius = 10}) {
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
        Navi.popAndPush(context, AreaRoute());
      }
    },
    (){
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      PathInfo.setNewVertexes(vertex);
      Navi.push(context, PanoramaRoute(currentVertex: PathInfo.currentVertex!, nextVertex: PathInfo.nextVertex,));
    },
    pictureSize,
    radius: radius
  );
}


Positioned getVertexAsButton(Vertex vertex, Function onTap, Function onLongPress, Function onDoubleTap, PictureSize pictureSize, {double radius = 10}) {
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
  double vertexDiameter = 0;
  if(radius == 10){
    vertexDiameter = pictureSize.getRadius() * 2;
  }
  else{
    vertexDiameter = radius;
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
                height: vertexDiameter,
                width: vertexDiameter,
                child: CustomPaint(
                  foregroundPainter: Circle(color, vertexDiameter / 2),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
          )
      )
  );
}
