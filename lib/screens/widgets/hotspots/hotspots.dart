import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

import '../../../models/path_model.dart';
import '../../../models/room_model.dart';
import '../../../models/vertex_model.dart';
import '../../../navigation/app_router.gr.dart';
import '../../../navigation/navi.dart';
import '../../../styles/text_styles/text_styles.dart';
import '../../panorama_screen.dart';

Hotspot getRoomHotspot(Room room)
{
  return Hotspot(
    width: room.titleBoxWidth,
    height: room.titleBoxHeight,
    longitude: room.titleX,
    latitude: room.titleY,
    orgin: Offset.fromDirection(0),
    widget: Text(room.title,
        textAlign: TextAlign.center,
        style: textStyleRoomTitleOnPanorama(room)),
  );
}

Hotspot getHotspotArrow(double x, double y, double angle, double size)
{
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget:RotationTransition(
        turns: AlwaysStoppedAnimation(angle / 360),
        child: const Image(
          image: AssetImage('assets/icons/arrow.png'),
        ),
      )


  );
}

Hotspot getHotspotPoint(double x, double y, double size,
    BuildContext context, Vertex curent, int iconAngle)
{
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget:ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          PathInfo.move();
          Navi.pushReplacement(context, PanoramaRoute(currentVertex: curent));
        },
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image( opacity: const AlwaysStoppedAnimation<double>(1),
            image: AssetImage('assets/icons/point_$iconAngle.png'),
          ),
        )
        ,)
  );
}

Hotspot getHotspotNextPoint(double x, double y, double size,
    BuildContext context, Vertex current, int iconAngle)
{
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget:ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          PathInfo.move();
          Navi.pushReplacement(context, PanoramaRoute(currentVertex: current, nextVertex: PathInfo.nextVertex));
        },
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image( opacity: const AlwaysStoppedAnimation<double>(1),
            image: AssetImage('assets/icons/point_$iconAngle.png'),
          ),
        ),
      ),
  );
}

Hotspot getHotspotOpenDoor(double x, double y, double angle, double size,
    BuildContext context, Vertex current, Vertex next, Vertex currentVertex)
{
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget:ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () => Navi.pushReplacement(context, PanoramaRoute(currentVertex: current, nextVertex: next),),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(angle / 360),
          child: const Image( opacity: AlwaysStoppedAnimation<double>(1),
            image: AssetImage('assets/icons/open_door.png'),
          ),
        )
        ,)
  );
}