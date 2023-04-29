import 'package:flutter/material.dart';

import '../models/building_model.dart';
import '../services/building_servce.dart';
import '../services/locator.dart';

class BuildingsProvider with ChangeNotifier {
  late List<Building> _buildings;

  List<Building> get buildings {
    return [..._buildings];
  }

  Building getById(String id){
    return _buildings.firstWhere((l) => l.id == id);
  }

  Future<List<Building>> getAll() async {
    return _buildings = await getIt<BuildingService>().getAll();
  }

  Future<void> delete(Building building) async {
    await getIt<BuildingService>().delete(building);
    _buildings.remove(building);
    notifyListeners();
  }

  Future<void> addOrUpdate(Building building) async {
    await getIt<BuildingService>().addOrUpdate(building);
    notifyListeners();
  }
}