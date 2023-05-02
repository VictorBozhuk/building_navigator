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
  required Future Function() func,
  required PictureSize pictureSize,
  VertexesProvider? vertexProvider,
  required double radius,
  bool isAreaConnection = false
}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () async {
      if(isAreaConnection == true){
        vertexProvider!.differentAreaVertexSelected = vertex;
        await func();
        return;
      }

      vertexProvider!.firstSelected = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      await func();
    },
    onLongPress: () async {
      if(isAreaConnection == false){
        vertexProvider!.secondSelected = vertex;
        await func();
      }
    },
    pictureSize: pictureSize,
    radius: radius,
    vertexProvider: vertexProvider,
  );
}

Positioned getSecondVertexAsButtonOnSecondArea({
  required Vertex vertex,
  required BuildContext context,
  required VertexesProvider vertexProvider,
  required double radius,
  required PictureSize pictureSize}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      vertexProvider.differentAreaVertexSelected = vertex;
      //Navi.pop(context);
      //Navi.popAndPushReplacement(context, AddVertexRoute());
    },
    pictureSize: pictureSize,
    radius: radius,
    vertexProvider: vertexProvider,
  );
}

Positioned getVertexAsButtonOn2DMapForUser({
  required Vertex vertex,
  required BuildContext context,
  required Function func,
  required VertexesProvider vertexProvider,
  required PictureSize pictureSize,
  required double radius}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      vertexProvider.firstSelected = vertex;
      //PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    onLongPress: (){
      vertexProvider.firstSelected = vertex;
      //PathInfo.sourceVertex = vertex;
      Navi.push(context, PanoramaRoute(currentVertex: vertex));
    },
    pictureSize: pictureSize,
    radius: radius,
    vertexProvider: vertexProvider,
  );
}

Positioned getVertexAsButtonOn2DMapForUserWithPath({
  required Vertex vertex,
  required BuildContext context,
  required Function func,
  required VertexesProvider vertexProvider,
  required PictureSize pictureSize,
  required double radius}) {
  return getVertexAsButton(
    vertex: vertex,
    onTap: () {
      vertexProvider.firstSelected = vertex;
      //PathInfo.sourceVertex = vertex;
      //print("pressed (${vertex.title}) $x , $y");
      func();
    },
    onLongPress: () {
      ///
      /// Показати іншу зону
      ///
      if(vertex.areaConnectionId != null){
        if(vertex.areaConnection == null){
          print("///");
          print("vertex.areaConnection is NULL");
          print("///");
          return;
        }
        Navi.popAndPush(context, AreaRoute(area: vertex.areaConnection!));
      }
    },
    onDoubleTap: (){
      vertexProvider.firstSelected = vertex;
      //PathInfo.sourceVertex = vertex;
      PathInfo.setNewVertexes(vertex);
      //Navi.push(context, PanoramaRoute(currentVertex: PathInfo.currentVertex!, nextVertex: PathInfo.nextVertex,));
    },
    pictureSize: pictureSize,
    radius: radius,
    vertexProvider: vertexProvider
  );
}


Positioned getVertexAsButton({
  required Vertex vertex,
  required Function onTap,
  required PictureSize pictureSize,
  Function onLongPress = defaultFunc,
  Function onDoubleTap = defaultFunc,
  VertexesProvider? vertexProvider,
  required double radius})
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
                height: radius,
                width: radius,
                child: CustomPaint(
                  foregroundPainter: Circle(color, radius / 2),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
          )
      )
  );
}
