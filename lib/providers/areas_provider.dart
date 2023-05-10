import 'package:flutter/material.dart';

import '../algorithm/building_navigator.dart';
import '../models/area_model.dart';
import '../models/building_model.dart';
import '../models/edge_model.dart';
import '../models/room_model.dart';
import '../models/vertex_connection_model.dart';
import '../models/vertex_model.dart';
import '../services/area_service.dart';
import '../services/locator.dart';
import '../services/vertex_service.dart';

class AreasProvider with ChangeNotifier {
  Vertex? firstSelected;
  Vertex? secondSelected;
  Vertex? differentAreaVertexSelected;
  VertexConnection? connection;

  late List<Area> _areas;
  late List<Vertex> vertexesOfPath = [];
  late List<Vertex> allVertexes = [];
  late List<Room> _allRooms = [];
  bool isShowPath = false;
  late Room destination;

  int _currentIndex = 0;
  late Vertex current;
  late Vertex? next;
  late Building building;

  List<Area> get areas {
    return [..._areas];
  }

  List<Room> get allRooms {
    return [..._allRooms];
  }

  Area getById(String id){
    return _areas.firstWhere((l) => l.id == id);
  }

  Future<List<Area>> getAll(Building building) async {
    this.building = building;
    return _areas = await getIt<AreaService>().getAll(building.id);
  }

  Future<List<Area>> getAllWithCollections(Building building) async {
    this.building = building;
    _areas = await getIt<AreaService>().getAll(building.id);
    allVertexes.clear();
    for(var a in _areas){
      a.vertexes = await getIt<VertexService>().getAll(a);
      allVertexes.addAll(a.vertexes);
    }
    _allRooms.clear();
    for(var a in areas){
      for(var v in a.vertexes){
        _allRooms.addAll(v.rooms);
        if(v.areaConnectionId != null){
          v.areaConnection = areas.firstWhere((area) => area.id == v.areaConnectionId);
        }
        for(var vc in v.vertexConnections){
          vc.nextVertex = allVertexes.firstWhere((av) => av.id == vc.nextVertexId);
        }
      }
    }

    return _areas;
  }

  Future<void> delete(Area area) async {
    await getIt<AreaService>().delete(area);
    _areas.remove(area);
    notifyListeners();
  }

  Future<void> addOrUpdate(Area area) async {
    await getIt<AreaService>().addOrUpdate(area);
    notifyListeners();
  }

  VertexConnection getConnection(){
    if(firstSelected!.vertexConnections.any((x) => x.nextVertexId == secondSelected!.id)){
      return firstSelected!.vertexConnections.firstWhere((x) => x.nextVertexId == secondSelected!.id);
    }

    return VertexConnection.empty(firstSelected!.id, secondSelected!.id);
  }

  bool isJoinPossible(){
    return firstSelected != null && secondSelected != null;
  }

  Future<void> setPath() async {
    PathFinder client = PathFinder(await _getEdges(building), allVertexes);
    var vertexIds = client.GetPath(firstSelected!.id, _getDestinationVertex(destination).id);
    vertexesOfPath.clear();
    for(var vi in vertexIds!){
      vertexesOfPath.add(allVertexes.firstWhere((av) => vi == av.id));
    }
    isShowPath = true;
    _currentIndex = 0;
    current = vertexesOfPath[0];
    next = vertexesOfPath[1];
    // check if 2 objects
    notifyListeners();
  }

  Vertex? getNextVertex(Vertex current){
    if(vertexesOfPath.any((v) => v.id == current.id) == true){
      var vertex = vertexesOfPath.firstWhere((v) => v.id == current.id);
      _currentIndex = vertexesOfPath.indexOf(vertex);
      if(_currentIndex + 1 < vertexesOfPath.length){
        current = vertex;
        next = vertexesOfPath[_currentIndex + 1];
        return next;
      }
    }

    return null;
  }

  void move(){
    if(isShowPath){
      if(_currentIndex + 2 != vertexesOfPath.length){
        current = vertexesOfPath[++_currentIndex];
        next = vertexesOfPath[1 + _currentIndex];
      }
      else{
        current = vertexesOfPath[++_currentIndex];
      }
    }
  }

  Vertex _getDestinationVertex(Room room){
    return allVertexes.firstWhere((v) => v.id == room.vertexId);
  }

  Future<List<Edge>> _getEdges(Building building) async {
    List<Edge> edges = [];
    for(var v in allVertexes){
      for(var vc in v.vertexConnections){
        if(_isSameEdge(edges, vc.nextVertex!.id) == false){
          edges.add(Edge(v.id, vc.nextVertex!.id, vc.length));
        }
      }
    }

    return edges;
  }

  bool _isSameEdge(List<Edge> edges, String vertexId){
    for(int i = 0; i < edges.length; ++i){
      if(edges[i].vertexId1 == vertexId){
        return true;
      }
    }

    return false;
  }
}