import 'package:lnu_navigator/models/path_model.dart';
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

  List<Vertex> getAllVertexes(){
    List<Vertex> vertexes = [];
    for(int i = 0; i < areas.length; ++i){
      vertexes.addAll(areas[i].vertexes!);
    }

    return vertexes;
  }

  double getNextVertexDirection(Vertex current, Vertex next)
  {
    for(int i = 0; i < current.vertexConnections!.length; ++i) {
      if(current.vertexConnections![i].nextVertex.uid == next.uid){
        return current.vertexConnections![i].direction;
      }
    }

    return 0;
  }

  List<Hotspot> getAllHotspots(BuildContext context, Vertex current)
  {
    List<Hotspot> hotspots = [];

    for(int i = 0; i < current.rooms!.length; ++i){
      var room = current.rooms?[i];
      hotspots.add(getHotspotTitleRoom(
        room!.title,
        room.titleX,
        room.titleY));
    }

    for(int i = 0; i < current.vertexConnections!.length; ++i) {
      var nextVertex = PathInfo.building.getAllVertexes().firstWhere((x)
        => x.uid == current.vertexConnections![i].nextVertex.uid);
      hotspots.add(getHotspotPoint(
        current.vertexConnections![i].iconX,
        current.vertexConnections![i].iconY,
        current.vertexConnections![i].iconSize,
        context,
        nextVertex,
        current.vertexConnections![i].iconPath ?? '',
      ));
    }

    return hotspots;
  }

  List<Hotspot> getNextHotspots(BuildContext context, Vertex current, Vertex next)
  {
    List<Hotspot> hotspots = [];

    for(int i = 0; i < current.rooms!.length; ++i){
      var room = current.rooms?[i];
      hotspots.add(getHotspotTitleRoom(
          room!.title,
          room.titleX,
          room.titleY));
    }

    for(int i = 0; i < current.vertexConnections!.length; ++i) {
      if(current.vertexConnections![i].nextVertex.uid == next.uid){
        var nextVertex = PathInfo.building.getAllVertexes().firstWhere((x)
        => x.uid == next.uid);
        hotspots.add(getHotspotNextPoint(
          current.vertexConnections?[i].iconX ?? 0,
          current.vertexConnections?[i].iconY ?? 0,
          current.vertexConnections?[i].iconSize ?? 0,
          context,
          nextVertex,
          current.vertexConnections?[i].iconPath ?? '',
        ));
      }
    }

    return hotspots;
  }

  List<Edge> getEdges(){
    List<Edge> edges = [];
    var allVertexes = getAllVertexes();
    for(int i = 0; i < allVertexes.length; ++i){
      int length = allVertexes[i].vertexConnections?.length ?? 0;
      for(int j = 0; j < length; ++j){
        if(isSameEdge(edges, allVertexes[i].vertexConnections![j].nextVertex.uid) == false){
          edges.add(Edge(allVertexes[i].uid, allVertexes[i].vertexConnections![j].nextVertex.uid, allVertexes[i].vertexConnections?[j].length ?? 0));
        }
      }
    }

    return edges;
  }

  bool isSameEdge(List<Edge> edges, String vertexId){
    for(int i = 0; i < edges.length; ++i){
      if(edges[i].vertexId1 == vertexId){
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