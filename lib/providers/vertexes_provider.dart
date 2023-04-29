import 'package:flutter/material.dart';

import '../models/area_model.dart';
import '../models/building_model.dart';
import '../models/vertex_connection_model.dart';
import '../models/vertex_model.dart';
import '../services/area_service.dart';
import '../services/database.dart';
import '../services/locator.dart';
import '../services/vertex_service.dart';

class VertexesProvider with ChangeNotifier {
  Vertex? firstSelected;
  Vertex? secondSelected;
  Vertex? differentAreaSelected;
  VertexConnection? connection;

  late Building building;
  late List<Vertex> _vertexes;

  List<Vertex> get vertexes {
    return [..._vertexes];
  }

  Vertex getById(String id){
    return _vertexes.firstWhere((l) => l.id == id);
  }

  Future<List<Vertex>> getAll(Area area) async {
    return _vertexes = await getIt<VertexService>().getAll(area);
  }

  Future<void> delete(Vertex vertex, Area area) async {
    await getIt<VertexService>().delete(vertex, area);
    _vertexes.remove(vertex);
    notifyListeners();
  }

  Future<void> addOrUpdate(Vertex vertex, Area area) async {
    await getIt<VertexService>().addOrUpdate(vertex, area);
    notifyListeners();
  }


  bool setConnection(){
    if(firstSelected!.vertexConnections.any((x) => x.nextVertex!.id == secondSelected!.id)){
      connection = firstSelected!.vertexConnections.firstWhere((x) => x.nextVertex!.id == secondSelected!.id);
      return true;
    }

    return false;
  }
}