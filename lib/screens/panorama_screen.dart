import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../models/vertex_model.dart';

class PanoramaScreen extends StatelessWidget {
  PanoramaScreen({Key? key, required this.currentVertex, this.nextVertex}) : super(key: key);
  late Vertex currentVertex;
  late Vertex? nextVertex;
  @override
  Widget build(BuildContext context) {
    List<Hotspot> hotspots = [];
    double direction = 0;
    if(PathInfo.isWalk == true){
      hotspots = PathInfo.building.getAllHotspots(context, currentVertex);
    } else {
      hotspots = PathInfo.building.getNextHotspots(context, currentVertex, nextVertex!);
      direction = PathInfo.building.getNextVertexDirection(currentVertex, nextVertex!);
    }

    return Scaffold(
      appBar: getAppBar(currentVertex.title!, context),
      body: Panorama(
        longitude: UserInfo.getDirection(direction),
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.network(currentVertex.panoramaImagePath!)
      ),
    );
  }
}