import 'package:flutter/material.dart';

import '../models/area_model.dart';
import '../models/vertex_connection_model.dart';
import '../models/vertex_model.dart';
import '../models/vertex_model.dart';
import '../services/locator.dart';
import '../services/vertex_service.dart';

class VertexesProvider with ChangeNotifier {
  late Area area;

  Future<List<Vertex>> getAll(Area area) {
    return getIt<VertexService>().getAll(area);
  }

  Future<void> delete(Vertex vertex, Area area) async {
    await getIt<VertexService>().delete(vertex, area);
    notifyListeners();
  }

  Future<void> addOrUpdate(Vertex vertex, Area area) async {
    await getIt<VertexService>().addOrUpdate(vertex, area);
    notifyListeners();
  }


}