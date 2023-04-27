import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/area_model.dart';
import '../models/building_model.dart';
import 'building_servce.dart';
import 'locator.dart';

class AreaService {
  CollectionReference<Map<String, dynamic>> getCollection(String buildingId){
    return  getIt<BuildingService>().getDoc(buildingId).collection("areas");
  }

  DocumentReference getDoc(Area area){
    return getCollection(area.buildingId).doc(area.id);
  }

  Future addOrUpdate(Area area) async {
    return await getCollection(area.buildingId).doc(area.id).set(area.toMap());
  }

  Future delete(Area area) async {
    return await getCollection(area.buildingId).doc(area.id).delete();
  }

  Future<List<Area>> getAll(String buildingId) {
    return getCollection(buildingId).snapshots().map((data) => data.docs.map((doc) =>
        Area.fromJson(doc.data())).toList()).first;
  }
}