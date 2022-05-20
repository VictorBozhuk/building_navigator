import 'package:building_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';

class PanoramaScreen extends StatelessWidget {
  PanoramaScreen({Key? key, required this.panoramaImagePath, required this.nextVertexImagePath}) : super(key: key);
  final String panoramaImagePath;
  final String nextVertexImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
        longitude:  PathInfo.building.getNextVertexDirection(panoramaImagePath, nextVertexImagePath),
        sensitivity: 2,
        hotspots: PathInfo.building.getHotspots(context, panoramaImagePath, nextVertexImagePath),
        child: Image.asset(panoramaImagePath),
      ),
    );
  }
}