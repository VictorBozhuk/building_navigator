import 'package:lnu_navigator/loader/vertex_loader.dart';

import '../../models/area_model.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import '../../services/area_service.dart';
import '../../services/locator.dart';

class AreaLoader {
  late Building building;
  late List<Area> areas = [];
  AreaLoader(this.building);

  Future<void> addAreas() async {
    var a7 = get700Area();
    await getIt<AreaService>().addOrUpdate(a7);
    var vs7 = Vertex7Loader(a7);
    await vs7.addVertexes();

    var a6 = get600Area();
    await getIt<AreaService>().addOrUpdate(a6);
    var vs6 = Vertex6Loader(a6);
    await vs6.addVertexes();


    areas.add(a7);
    areas.add(a6);
  }

  Area get700Area(){
    return Area(
      "700_t",
      building.id,
      "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2FAreas%2F700.png?alt=media&token=e1326fa3-88a8-46c2-833e-fa50d35c5de0",
      0,
      3,
      //vertexes: [v7_6, v7, v701A, v714A]
    );
  }

  Area get600Area(){
    return Area(
      "600_t",
      building.id,
      "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2FAreas%2F600.png?alt=media&token=35357e2e-725f-4249-aa75-30c29fc9ff2e",
      0,
      3,
      //vertexes: [v6_7, v6, v601A, v614A]
    );
  }
}
