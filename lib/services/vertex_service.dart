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

  Future<List<Vertex>> getAll(String areaId) {
    return getCollection(areaId).snapshots().map((data) => data.docs.map((doc) =>
        Vertex.fromJson(doc.data())).toList()).first;
  }


  Future<void> _deleteConnectionOfNextVertexes(Vertex vertex) async {
    await deleteConnectionOfNextArea(vertex);
    var vertexes = await getAll(vertex.areaId);
    for(var vc in vertex.vertexConnections){
      if(vertexes.any((v) => v.id == vc.nextVertexId)){
        var nextVertex = vertexes.firstWhere((v) => v.id == vc.nextVertexId);
        nextVertex.vertexConnections.removeWhere((nvc) => nvc.nextVertexId == vertex.id);
        await addOrUpdate(nextVertex);
      }
    }
  }

  Future<void> deleteConnectionOfNextArea(Vertex vertex) async {
    if(vertex.areaConnectionId != null){
      var nextArea = (await getIt<AreaService>().getAll())
          .firstWhere((x) => x.id == vertex.areaConnectionId);
      var vertexes = await getAll(nextArea.id);
      try{
        for(var v in vertexes){
          for(var vc in v.vertexConnections.toList()){
            if(vc.nextVertexId == vertex.id){
              v.areaConnection = null;
              vertex.areaConnection = null;
              v.areaConnectionId = null;
              vertex.areaConnectionId = null;
              v.vertexConnections.remove(vc);
              vertex.vertexConnections.removeWhere((vvc) => vvc.nextVertexId == v.id);
              await addOrUpdate(vertex);
              await addOrUpdate(v);
            }
          }
        }
      }
      catch(ex){
        print("------------------${ex.toString()}");
      }
    }
  }
}