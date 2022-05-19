import 'package:building_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../loader/hotspots/hotspots.dart';
import '../models/path_model.dart';

class ParoramaScreenTest extends StatefulWidget{
  ParoramaScreenTest({Key? key, required this.panoramaImagePath, required this.nextVertexImagePath}) : super(key: key);
  final String panoramaImagePath;
  final String nextVertexImagePath;

  @override
  State<StatefulWidget> createState() =>
      PanoramaScreenState(panoramaImagePath: panoramaImagePath,
          nextVertexImagePath: nextVertexImagePath);
}


class PanoramaScreenState extends State<ParoramaScreenTest> {
  PanoramaScreenState({required this.panoramaImagePath, required this.nextVertexImagePath});
  final String panoramaImagePath;
  final String nextVertexImagePath;

  late double directionLongitude = 0;

  late double pointLongitude = 0;
  late double pointLatitude = 0;
  late List<Hotspot> hotspots = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
        onTap: (longitude, latitude, tilt) {
          pointLongitude = longitude;
          pointLatitude = latitude;
          setState(() {
            hotspots = [getHotspotPointTest(pointLongitude, pointLatitude, 100)];
          });
        },
        onViewChanged: ( longitude,  latitude,  tilt) {
          directionLongitude = longitude;
        },
        longitude: directionLongitude,
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.asset(panoramaImagePath),

      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            hotspots = [getHotspotPointTest(pointLongitude, pointLatitude, 100)];
          });
        },
      ),
    );
  }
}

Hotspot getHotspotPointTest(double x, double y, double size)
{
  return Hotspot(
      height: size,
      width: size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget:Image(image: AssetImage('assets/icons/point.png')),
  );
}