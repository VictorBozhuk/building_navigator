import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/area_model.dart';
import '../models/vertex_model.dart';
import 'area_service.dart';
import 'locator.dart';

class VertexService {
  CollectionReference<Map<String, dynamic>> getCollection(String areaId){
    return  getIt<AreaService>().getDoc(areaId).collection("vertexes");
  }

  Future addOrUpdate(Vertex vertex) async {
    return await getCollection(vertex.areaId).doc(vertex.id).set(vertex.toMap());
  }

  Future delete(Vertex vertex) async {
    await _deleteConnectionOfNextVertexes(vertex);
    return await getCollection(vertex.areaId).doc(vertex.id).delete();
  }

  Future<List<Vertex>> getAll(Area area) {
    return getCollection(area.id).snapshots().map((data) => data.docs.map((doc) =>
        Vertex.fromJson(doc.data())).toList()).first;
  }


  Future<void> _deleteConnectionOfNextVertexes(Vertex vertex) async {
    await _deleteConnectionOfNextArea(vertex);
    for(var vc in vertex.vertexConnections){
      vc.nextVertex!.vertexConnections.removeWhere((nvc) => nvc.nextVertexId == vertex.id);
      if(vc.nextVertex!.areaId != vertex.areaId){
        await addOrUpdate(vc.nextVertex!);
      }
    }
  }

  Future<void> _deleteConnectionOfNextArea(Vertex vertex) async {
    if(vertex.areaConnectionId != null){
      var nextArea = (await getIt<AreaService>().getAll())
          .firstWhere((x) => x.id == vertex.areaConnectionId);
      var vertexes = await getAll(nextArea);
      for(var v in vertexes){
        for(var vc in v.vertexConnections.toList()){
          if(vc.nextVertex!.id == vertex.id){
            v.areaConnectionId = null;
            v.vertexConnections.remove(vc);
            await addOrUpdate(v);
          }
        }
      }
    }
  }
}