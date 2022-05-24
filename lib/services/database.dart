import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/building_model.dart';

class DatabaseService {
  static CollectionReference buildingConnection = FirebaseFirestore.instance.collection('buildings');

  static Future addOrUpdateBuilding(Building building) async {
    return await buildingConnection.doc(building.uid).set(building.toMap());
  }

  static Stream<QuerySnapshot> getBuildingSnapshots(){
    return buildingConnection.snapshots();
  }

  static Stream<List<Building>> getBuildings()
  {
    return buildingConnection.snapshots().map((data) => data.docs.map((doc) =>
        Building.fromJson(doc.id, doc.data() as Map<String, dynamic>)).toList());
  }
}