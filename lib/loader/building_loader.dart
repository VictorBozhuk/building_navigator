import 'package:lnu_navigator/services/building_servce.dart';

import '../models/building_model.dart';
import '../services/locator.dart';
import 'area_loader.dart';

class BuildingLoader{
  static List<Building> buildings =
  [
    Building(
      "LNU Dormitory 1_",
      'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2Fdormitory_3.jpg?alt=media&token=83fb1ae9-3906-4f5a-ae96-01ed94919583',
    ),
    Building(
      "LNU Dormitory 2",
      'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_2%2Fdormitory_2.jpg?alt=media&token=05826e91-256e-4fa7-bd55-4c4ee21e1789',
    ),
    Building(
      "LNU Dormitory 4",
      'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_4%2Fdormitory_4.jpg?alt=media&token=7f841362-5592-4da3-94d5-e970091f60fe',
    )
  ];

  Future<void> addBuildings() async {
    for(var b in buildings){
      await getIt<BuildingService>().addOrUpdate(b);
      await addAreas(b);
    }
  }

  Future<void> addAreas(Building building) async {
    var areaLoader = AreaLoader(building);
    await areaLoader.addAreas();
    building.areas.addAll(areaLoader.areas);
  }
}

