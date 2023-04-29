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
    await _deleteConnectionOfNextVertexes(vertex, area);
    return await getCollection(area).doc(vertex.id).delete();
  }

  Future<List<Vertex>> getAll(Area area) {
    return getCollection(area).snapshots().map((data) => data.docs.map((doc) =>
        Vertex.fromJson(doc.data())).toList()).first;
  }


  Future<void> _deleteConnectionOfNextVertexes(Vertex vertex, Area area) async {
    await _deleteConnectionOfNextArea(vertex, area);
    for(var vc in vertex.vertexConnections!){
      vc.nextVertex!.vertexConnections!.removeWhere((nvc) => nvc.nextVertexId == vertex.id);
      if(vc.nextVertex!.areaId != area.id){
        await addOrUpdate(vc.nextVertex!, area);
      }
    }
  }

  Future<void> _deleteConnectionOfNextArea(Vertex vertex, Area area) async {
    if(vertex.areaConnectionId != null){
      var nextArea = (await getIt<AreaService>().getAll(area.buildingId))
          .firstWhere((x) => x.id == vertex.areaConnectionId);
      var vertexes = await getAll(nextArea);
      for(var v in vertexes){
        for(var vc in v.vertexConnections!.toList()){
          if(vc.nextVertex!.id == vertex.id){
            v.areaConnectionId = null;
            v.vertexConnections?.remove(vc);
            await addOrUpdate(v, nextArea);
          }
        }
      }
    }
  }
}