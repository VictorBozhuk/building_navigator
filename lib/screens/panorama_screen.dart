import 'package:building_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';

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
        child: Image.network(panoramaImagePath)

      ),
    );
  }
}