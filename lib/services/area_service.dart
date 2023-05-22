import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/area_model.dart';
import 'locator.dart';

class AreaService {
  final CollectionReference _connection = FirebaseFirestore.instance.collection('areas');

  DocumentReference getDoc(Area area){
    return _connection.doc(area.id);
  }

  Future addOrUpdate(Area area) async {
    return await _connection.doc(area.id).set(area.toMap());
  }

  Future delete(Area area) async {
    return await _connection.doc(area.id).delete();
  }

  Future<List<Area>> getAll() {
    return _connection.snapshots().map((data) => data.docs.map((doc) =>
        Area.fromJson(doc.data() as Map<String, dynamic>)).toList()).first;
  }
}