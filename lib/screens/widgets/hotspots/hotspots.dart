import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

import '../../../models/path_model.dart';
import '../../../models/vertex_model.dart';
import '../../panorama_screen.dart';

Hotspot getHotspotTitleRoom(String title, double x, double y)
{
  return Hotspot(
      height: 40,
      width: title.length * 30,
      latitude: y,
      longitude: x,
      orgin: Offset.fromDirection(0),
      widget: Text(title,
          style: const TextStyle(
              color: Colors.red,
              fontFamily: 'Poppins',
              fontSize: 40,
              fontWeight: FontWeight.w700))
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
    BuildContext context, Vertex curent, String iconImagePath)
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
        onPressed: () => {
          PathInfo.move(),
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              PanoramaScreen(currentVertex: curent)),
        )},
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image( opacity: const AlwaysStoppedAnimation<double>(1),
            image: AssetImage(iconImagePath),
          ),
        )
        ,)
  );
}

Hotspot getHotspotNextPoint(double x, double y, double size,
    BuildContext context, Vertex curent, String iconImagePath)
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
        onPressed: () => {
          PathInfo.move(),
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>
                PanoramaScreen(currentVertex: curent, nextVertex: PathInfo.nextVertex)),
          )},
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image( opacity: const AlwaysStoppedAnimation<double>(1),
            image: AssetImage(iconImagePath),
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
        onPressed: () => {Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>
              PanoramaScreen(
                  currentVertex: current, nextVertex: next)),
        )},
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(angle / 360),
          child: const Image( opacity: AlwaysStoppedAnimation<double>(1),
            image: AssetImage('assets/icons/open_door.png'),
          ),
        )
        ,)
  );
}