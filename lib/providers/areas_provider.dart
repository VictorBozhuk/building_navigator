import 'package:flutter/material.dart';

import '../models/area_model.dart';
import '../models/building_model.dart';
import '../services/area_service.dart';
import '../services/database.dart';
import '../services/locator.dart';

class AreasProvider with ChangeNotifier {
  late List<Area> _areas;

  List<Area> get areas {
    return [..._areas];
  }

  Area getById(String id){
    return _areas.firstWhere((l) => l.id == id);
  }

  Future<List<Area>> getAll(String buildingId) async {
    return _areas = await getIt<AreaService>().getAll(buildingId);
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