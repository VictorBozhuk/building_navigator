

import 'package:flutter/cupertino.dart';
import 'package:lnu_navigator/providers/vertexes_provider.dart';
import 'package:panorama/panorama.dart';

import '../../models/building_model.dart';
import '../../models/edge_model.dart';
import '../../models/path_model.dart';
import '../../models/room_model.dart';
import '../../models/vertex_model.dart';
import '../../providers/areas_provider.dart';
import '../../providers/buildings_provider.dart';
import '../../services/locator.dart';
import '../widgets/hotspots/hotspots.dart';

List<Room> getRoomsOfBuildingByTitle(Building building, String title)
{
  List<Room> rooms = [];
  for (var x in building.areas) {
    x.vertexes.forEach((c) {
      rooms.addAll(c.rooms?.where((v) =>
          v.title.toLowerCase().contains(title.toLowerCase())) ?? []);
    });
  }

  rooms.sort((a, b) => a.title.compareTo(b.title));
  return rooms;
}


Future<List<Vertex>> getAllVertexes(Building building) async {
  List<Vertex> vertexes = [];
  var areas = await getIt<AreasProvider>().getAll(building.id);
  for(var area in areas){
    var vertexesArea = await getIt<VertexesProvider>().getAll(area);
    vertexes.addAll(vertexesArea);
  }

  return vertexes;
}

double getNextVertexDirection(Vertex current, Vertex next)
{
  for(int i = 0; i < current.vertexConnections!.length; ++i) {
    if(current.vertexConnections![i].nextVertex!.id == next.id){
      return current.vertexConnections![i].direction;
    }
  }

  return 0;
}

Future<List<Hotspot>> getAllHotspots(BuildContext context, Vertex current) async
{
  List<Hotspot> hotspots = [];

  for(int i = 0; i < current.rooms!.length; ++i){
    hotspots.add(getRoomHotspot(current.rooms![i]));
  }

  for(int i = 0; i < current.vertexConnections!.length; ++i) {
    var nextVertex = (await getAllVertexes(PathInfo.building)).firstWhere((x)
    => x.id == current.vertexConnections![i].nextVertex!.id);
    hotspots.add(getHotspotPoint(
      current.vertexConnections![i].iconX,
      current.vertexConnections![i].iconY,
      current.vertexConnections![i].iconSize,
      context,
      nextVertex,
      current.vertexConnections![i].iconAngle,
    ));
  }

  return hotspots;
}

Future<List<Hotspot>> getNextHotspots(BuildContext context, Vertex current, Vertex next) async
{
  List<Hotspot> hotspots = [];

  for(int i = 0; i < current.rooms!.length; ++i){
    hotspots.add(getRoomHotspot(current.rooms![i]));
  }

  for(int i = 0; i < current.vertexConnections!.length; ++i) {
    if(current.vertexConnections![i].nextVertex!.id == next.id){
      var nextVertex = (await getAllVertexes(PathInfo.building)).firstWhere((x)
      => x.id == next.id);
      hotspots.add(getHotspotNextPoint(
          current.vertexConnections?[i].iconX ?? 0,
          current.vertexConnections?[i].iconY ?? 0,
          current.vertexConnections?[i].iconSize ?? 0,
          context,
          nextVertex,
          current.vertexConnections?[i].iconAngle ?? 0
      ));
    }
  }

  return hotspots;
}

Future<List<Edge>> getEdges(Building building) async {
  List<Edge> edges = [];
  var vertexes = await getAllVertexes(building);
  for(var v in vertexes){
    int length = v.vertexConnections?.length ?? 0;
    for(int j = 0; j < length; ++j){
      if(isSameEdge(edges, v.vertexConnections![j].nextVertex!.id) == false){
        edges.add(Edge(v.id, v.vertexConnections![j].nextVertex!.id, v.vertexConnections?[j].length ?? 0));
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