import 'package:flutter/material.dart';

import '../models/area_model.dart';
import '../models/room_model.dart';
import '../models/vertex_model.dart';
import '../services/area_service.dart';
import '../services/locator.dart';
import '../services/vertex_service.dart';

class AreasProvider with ChangeNotifier {
  late List<Area> _areas;
  late List<Room> _allRooms;

  List<Area> get areas {
    return [..._areas];
  }

  List<Room> get allRooms {
    return [..._allRooms];
  }

  Area getById(String id){
    return _areas.firstWhere((l) => l.id == id);
  }

  Future<List<Area>> getAll(String buildingId) async {
    return _areas = await getIt<AreaService>().getAll(buildingId);
  }

  Future<List<Area>> getAllWithCollections(String buildingId) async {
    _areas = await getIt<AreaService>().getAll(buildingId);
    List<Vertex> allVertexes = [];
    for(var a in _areas){
      a.vertexes = await getIt<VertexService>().getAll(a);
      allVertexes.addAll(a.vertexes);
    }
    _allRooms = [];
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
}