import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

import '../../../models/room_model.dart';
import '../../../models/vertex_model.dart';
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

Hotspot getHotspotPoint({
  required double x,
  required double y,
  required double size,
  required BuildContext context,
  required Vertex current,
  required Function onPressed,
  required int iconAngle}) {
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget: GestureDetector(
        onTap: () => onPressed(),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image(opacity: const AlwaysStoppedAnimation<double>(1),
            image: AssetImage('assets/icons/point_$iconAngle.png'),
          ),
        )
        ,)
  );
}