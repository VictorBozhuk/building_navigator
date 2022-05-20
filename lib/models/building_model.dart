import 'package:building_navigator/models/vertex_model.dart';
import 'package:panorama/panorama.dart';
import '../loader/hotspots/hotspots.dart';
import 'edge_model.dart';
import 'package:flutter/material.dart';

class Building {
  late String title;
  late List<Vertex> vertexes;
  late String imagePath;

  Building(this.title, this.imagePath, this.vertexes);

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

        int roomLength = vertexes[i].rooms?.length ?? 0;
        for(int j = 0; j < roomLength; ++ j){
          if(vertexes[i].rooms?[j].title == nextVertexImagePath){
            return vertexes[i].rooms?[j].direction ?? 0;
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
        int roomsLength = vertexes[i].rooms?.length ?? 0;
        for(int j = 0; j < roomsLength; ++ j){
          var room = vertexes[i].rooms?[j];
          hotspots.add(getHotspotTitleRoom(
            room?.title ?? '',
            room?.titleX ?? 0,
            room?.titleY ?? 0,));
        }
        if(isTitleAPathOfVertex(nextVertexImagePath) == false){
          return hotspots;
        }

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
      }
    }

    return hotspots;
  }

  List<Edge> getEdges(){
    List<Edge> edges = [];
    for(int i = 0; i < vertexes.length; ++i){
      int length = vertexes[i].vertexConnections?.length ?? 0;
      for(int j = 0; j < length; ++j){
        if(isSameEdge(edges, vertexes[i].vertexConnections?[j].vertexTitle ?? '') == false){
          edges.add(Edge(vertexes[i].title, vertexes[i].vertexConnections?[j].vertexTitle ?? '', vertexes[i].vertexConnections?[j].length ?? 0));
        }
      }
    }

    return edges;
  }

  bool isSameEdge(List<Edge> edges, String vertexTitle){
    for(int i = 0; i < edges.length; ++i){
      if(edges[i].vertexTitle1 == vertexTitle){
        return true;
      }
    }

    return false;
  }

  bool isTitleAPathOfVertex(String text){
    for(int i = 0; i < vertexes.length; ++i){
      if(vertexes[i].imagePath == text){
        return true;
      }
    }

    return false;
  }

}