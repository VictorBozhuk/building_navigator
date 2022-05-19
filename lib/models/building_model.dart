import 'package:flutter/material.dart';
import 'package:building_navigator/models/vertex_model.dart';
import 'package:panorama/panorama.dart';

import 'edge_model.dart';

class Building {
  late String title;
  late List<Vertex> vertexes;
  late List<Edge> edges;
  late String imagePath;
  late List<Hotspot> Function(BuildContext context, String vertexImagePath,
      String nextVertexImagePath) getHotspots;
  late double Function(String vertexImagePath,
      String nextVertexUmagePath) getDirection;

  Building(this.title, this.imagePath, this.vertexes, this.edges, this.getHotspots, this.getDirection);


}