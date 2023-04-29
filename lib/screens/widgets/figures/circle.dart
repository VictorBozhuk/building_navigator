import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/admin_info.dart';
import 'package:lnu_navigator/models/user_info.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/providers/vertexes_provider.dart';

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

Positioned getVertexAsButtonOn2DMap({
  required Vertex vertex,
  required Function func,
  required PictureSize pictureSize,
  VertexesProvider? vertexProvider,
  double radius = 10}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () => {
      AdminInfo.selectedVertex = vertex,
      //print("pressed (${vertex.title}) $x , $y");
      func(),
    },
    onLongPress: () {
      AdminInfo.secondSelectedVertex = vertex;
      func();
    },
    pictureSize: pictureSize,
    radius: radius
  );
}

Positioned getSecondVertexAsButtonOnSecondArea(Vertex vertex, BuildContext context, PictureSize pictureSize) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      AdminInfo.selectedVertexOnOtherArea = vertex;
      //Navi.pop(context);
      //Navi.popAndPushReplacement(context, AddVertexRoute());
    },
    pictureSize: pictureSize
  );
}

Positioned getVertexAsButtonOn2DMapForUser(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize, {double radius = 10}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    onLongPress: (){
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      Navi.push(context, PanoramaRoute(currentVertex: vertex));
    },
    pictureSize: pictureSize,
    radius: radius
  );
}

Positioned getVertexAsButtonOn2DMapForUserWithPath(Vertex vertex, BuildContext context, Function func, PictureSize pictureSize, {double radius = 10}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    onLongPress: () {
      ///
      /// Показати іншу зону
      ///
      if(vertex.areaConnectionId != null){
        UserInfo.area = UserInfo.building.areas.firstWhere((x) => x.id == vertex.areaConnection!.id);
        Navi.popAndPush(context, AreaRoute(area: vertex.areaConnection!));
      }
    },
    onDoubleTap: (){
      AdminInfo.selectedVertex = vertex;
      PathInfo.sourceVertex = vertex;
      PathInfo.setNewVertexes(vertex);
      Navi.push(context, PanoramaRoute(currentVertex: PathInfo.currentVertex!, nextVertex: PathInfo.nextVertex,));
    },
    pictureSize: pictureSize,
    radius: radius
  );
}


Positioned getVertexAsButton({
  required Vertex vertex,
  required Function onTap,
  required PictureSize pictureSize,
  Function onLongPress = defaultFunc,
  Function onDoubleTap = defaultFunc,
  VertexesProvider? vertexProvider,
  double radius = 10})
{
  var x = (pictureSize.width / (vertex.areaWidth / vertex.pointX)) - pictureSize.getRadius();
  var y = (pictureSize.height / (vertex.areaHeight / vertex.pointY)) - pictureSize.getRadius();
  MaterialColor color = Colors.red;
  if(vertex.isFullInfo()){
    color = Colors.blue;
  }
  if(vertex.areaConnectionId != null){
    color = Colors.yellow;
  }
  if(vertexProvider?.firstSelected != null && vertex.id == vertexProvider!.firstSelected!.id){
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
