import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/building_model.dart';

class DatabaseService {
  final CollectionReference _buildingConnection = FirebaseFirestore.instance.collection('buildings');

  Future addOrUpdateBuilding(Building building) async {
    return await _buildingConnection.doc(building.uid).set(building.toMap());
  }
}