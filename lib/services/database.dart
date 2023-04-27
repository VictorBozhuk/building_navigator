import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/building_model.dart';

class DatabaseService {
  CollectionReference<Map<String, dynamic>> getCollection(){
    return FirebaseFirestore.instance.collection('buildings');
  }
  static CollectionReference buildingConnection = FirebaseFirestore.instance.collection('buildings');

  Future addOrUpdate(Building building) async {
    return await buildingConnection.doc(building.id).set(building.toMap());
  }

  Future delete(Building building) async {
    return await buildingConnection.doc(building.id).delete();
  }

  Stream<QuerySnapshot> getBuildingSnapshots(){
    return buildingConnection.snapshots();
  }

  Stream<List<Building>> getBuildings()
  {
    return buildingConnection.snapshots().map((data) => data.docs.map((doc) =>
        Building.fromJson(doc.data() as Map<String, dynamic>)).toList());
  }

  Future<List<Building>> getAll() {
    return getCollection().snapshots().map((data) => data.docs.map((doc) =>
        Building.fromJson(doc.data())).toList()).first;
  }
}