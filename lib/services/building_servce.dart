import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/building_model.dart';

class BuildingService {
  final CollectionReference _connection = FirebaseFirestore.instance.collection('buildings');

  CollectionReference get connection {
    return _connection;
  }

  DocumentReference getDoc(String buildingId){
    return connection.doc(buildingId);
  }

  Future addOrUpdate(Building building) {
    return connection.doc(building.id).set(building.toMap());
  }

  Future delete(Building building) async {
    return await connection.doc(building.id).delete();
  }

  Stream<QuerySnapshot> getBuildingSnapshots(){
    return connection.snapshots();
  }

  Stream<List<Building>> getBuildings()
  {
    return connection.snapshots().map((data) => data.docs.map((doc) =>
        Building.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }

  Future<List<Building>> getAll() {
    return connection.snapshots().map((data) => data.docs.map((doc) =>
        Building.fromJson(doc.data() as Map<String, dynamic>)).toList()).first;
  }
}