import 'package:building_navigator/models/vertex_model.dart';
import 'package:panorama/panorama.dart';
import '../loader/hotspots/hotspots.dart';
import 'edge_model.dart';
import 'package:flutter/material.dart';

class Building {
  late String title;
  late List<Vertex> vertexes;
  late List<Edge> edges;
  late String imagePath;

  Building(this.title, this.imagePath, this.vertexes, this.edges);

  List<Vertex> getNeighbors(Vertex vertex){
    List<Vertex> neighbors = [];
    for(int i = 0; i < edges.length; ++i) {
      if(edges[i].vertex1.title == vertex.title){
        neighbors.add(edges[i].vertex1);
      } else if(edges[i].vertex2.title == vertex.title){
        neighbors.add(edges[i].vertex2);
      }
    }

    return neighbors;
  }

  double getNextVertexDirection(String currentVertexImagePath, String nextVertexImagePath)
  {
    for(int i = 0; i < vertexes.length; ++i){
      if(vertexes[i].imagePath == currentVertexImagePath){
        int vertexConnectionLength = vertexes[i].vertexConnections?.length ?? 0;
        for(int j = 0; j < vertexConnectionLength; ++ j){
          if(vertexes[i].vertexConnections?[j].vertexImagePath == nextVertexImagePath){
            return vertexes[i].vertexConnections?[j].direction ?? 0;
          }
        }
      }
    }

    return 0;
  }

  List<Hotspot> getHotspots(BuildContext context, String currentVertexImagePath, String nextVertexImagePath)
  {
    List<Hotspot> hotspots = [];
    for(int i = 0; i < vertexes.length; ++i){
      if(vertexes[i].imagePath == currentVertexImagePath){
        int vertexConnectionLength = vertexes[i].vertexConnections?.length ?? 0;
        for(int j = 0; j < vertexConnectionLength; ++ j){
          var nextVertex = vertexes[i].vertexConnections?[j];
          hotspots.add(getHotspotPoint(
            nextVertex?.iconX ?? 0,
            nextVertex?.iconY ?? 0,
            nextVertex?.iconSize ?? 0,
            context,
            nextVertex?.vertexImagePath ?? '',
            nextVertexImagePath,
            nextVertex?.iconPath ?? '',));
        }

        int roomsLength = vertexes[i].rooms?.length ?? 0;
        for(int j = 0; j < roomsLength; ++ j){
          var room = vertexes[i].rooms?[j];
          hotspots.add(getHotspotTitleRoom(
            room?.title ?? '',
            room?.titleX ?? 0,
            room?.titleY ?? 0,));

        }
      }
    }

    return hotspots;
  }
}