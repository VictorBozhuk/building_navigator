import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../models/vertex_model.dart';

class PanoramaScreen extends StatelessWidget {
  PanoramaScreen({Key? key, required this.curentVertex, this.nextVertex}) : super(key: key);
  late Vertex curentVertex;
  late Vertex? nextVertex;
  @override
  Widget build(BuildContext context) {
    List<Hotspot> hotspots = [];
    double direction = 0;
    if(PathInfo.isWalk == true){
      hotspots = PathInfo.building.getAllHotspots(context, curentVertex);
    } else {
      hotspots = PathInfo.building.getNextHotspots(context, curentVertex, nextVertex!);
      direction = PathInfo.building.getNextVertexDirection(curentVertex, nextVertex!);
    }

    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
        longitude: UserInfo.getDirection(direction),
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.network(curentVertex.panoramaImagePath!)

      ),
    );
  }
}