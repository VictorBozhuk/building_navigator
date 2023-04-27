import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/area_model.dart';
import '../models/building_model.dart';
import '../models/vertex_model.dart';
import 'area_service.dart';
import 'building_servce.dart';
import 'locator.dart';

class VertexService {
  CollectionReference<Map<String, dynamic>> getCollection(Area area){
    return  getIt<AreaService>().getDoc(area).collection("vertexes");
  }

  Future addOrUpdate(Vertex vertex, Area area) async {
    return await getCollection(area).doc(vertex.id).set(vertex.toMap());
  }

  Future delete(Vertex vertex, Area area) async {
    return await getCollection(area).doc(vertex.id).delete();
  }

  Future<List<Vertex>> getAll(Area area) {
    return getCollection(area).snapshots().map((data) => data.docs.map((doc) =>
        Vertex.fromJson(doc.data())).toList()).first;
  }
}