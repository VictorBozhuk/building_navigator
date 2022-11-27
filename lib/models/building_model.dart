import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:panorama/panorama.dart';
import '../screens/widgets/hotspots/hotspots.dart';
import 'area_model.dart';
import 'edge_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Building {
  late String uid;
  late String title;
  late List<Vertex> vertexes = [];
  late String imagePath;
  late List<Area> areas = [];

  Building(this.title, this.imagePath, this.vertexes){
    uid = const Uuid().v1();
  }

  Building.full(this.title, this.imagePath, this.areas){
    uid = const Uuid().v1();
  }

  Building.createEmpty(){
    uid = const Uuid().v1();
    title = '';
    imagePath = '';
  }

  Building.copy(this.uid, this.title, this.imagePath, this.areas);

  double getNextVertexDirection(String currentVertexImagePath, String nextVertexImagePath)
  {
    for(int i = 0; i < vertexes.length; ++i){
      if(vertexes[i].panoramaImagePath == currentVertexImagePath){
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
      if(vertexes[i].panoramaImagePath == currentVertexImagePath){
        int roomsLength = vertexes[i].rooms?.length ?? 0;
        for(int j = 0; j < roomsLength; ++ j){
          var room = vertexes[i].rooms?[j];
          hotspots.add(getHotspotTitleRoom(
            room?.title ?? '',
            room?.titleX ?? 0,
            room?.titleY ?? 0,));
        }
        /*
        if(isTitleAPathOfVertex(nextVertexImagePath) == true){
          return hotspots;
        }
*/
        int vertexConnectionLength = vertexes[i].vertexConnections?.length ?? 0;
        for(int j = 0; j < vertexConnectionLength; ++j){
          var nextVertex = vertexes[i].vertexConnections?[j];
          hotspots.add(getHotspotPoint(
            nextVertex?.iconX ?? 0,
            nextVertex?.iconY ?? 0,
            nextVertex?.iconSize ?? 0,
            context,
            nextVertex?.vertexImagePath ?? '',
            nextVertexImagePath,
            nextVertex?.iconPath ?? '',
              ));
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
          edges.add(Edge(vertexes[i].title.toString(), vertexes[i].vertexConnections?[j].vertexTitle ?? '', vertexes[i].vertexConnections?[j].length ?? 0));
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
      if(vertexes[i].panoramaImagePath == text){
        return true;
      }
    }

    return false;
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "title": title,
      "imagePath": imagePath,
      "vertexes": vertexes.map((w) => w.toMap()).toList(),
      "areas" : areas.map((w) => w.toMap()).toList(),
    };
  }

  Building.fromJson(Map<String, dynamic> data) {
    uid = data['uid'];
    title = data['title'];
    imagePath = data['imagePath'];
    if(data['vertexes'] == null){
      vertexes = [];
    } else {
      vertexes = (data['vertexes'] as List).map((w) => Vertex.fromJson(w)).toList();
    }

    if(data['areas'] == null){
      areas = [];
    } else{
      areas = (data['areas'] as List).map((w) => Area.fromJson(w)).toList();
    }
  }

  Building copy(){
    var copiedAreas = areas.map((w) => w.copy()).toList();

    return Building.copy(uid, title, imagePath, copiedAreas);
  }
}