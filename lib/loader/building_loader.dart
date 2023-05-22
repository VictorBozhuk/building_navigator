
import '../services/locator.dart';
import 'area_loader.dart';

class BuildingLoader{
  Future<void> addAreas() async {
    var areaLoader = AreaLoader();
    await areaLoader.addAreas();
  }
}

