import 'package:uuid/uuid.dart';

import '../models/building_model.dart';
import 'dormitory_3/vertexes_dormitory_3.dart';

List<Building> buildings = [
  Building(const Uuid().v1(), "LNU Dormitory 3", 'assets/buildings/dormitory_3.jpg',
      vertexesDormitory_3
      ),
  Building(const Uuid().v1(), "LNU Dormitory 2", 'assets/buildings/dormitory_2.jpg',
      vertexesDormitory_3
  ),
  Building(const Uuid().v1(), "LNU Dormitory 4", 'assets/buildings/dormitory_4.jpg',
      vertexesDormitory_3
  )
];




