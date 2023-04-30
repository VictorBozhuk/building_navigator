import 'package:flutter/material.dart';

import '../models/area_model.dart';
import '../models/building_model.dart';
import '../models/vertex_connection_model.dart';
import '../models/vertex_model.dart';
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


  VertexConnection getConnection(){
    if(firstSelected!.vertexConnections.any((x) => x.nextVertexId == secondSelected!.id)){
      return firstSelected!.vertexConnections.firstWhere((x) => x.nextVertexId == secondSelected!.id);
    }

    return VertexConnection.empty(firstSelected!.id, secondSelected!.id);
  }

  bool isJoinPossible(){
    return firstSelected != null && secondSelected != null;
  }
}