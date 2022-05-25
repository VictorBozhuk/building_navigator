import 'package:uuid/uuid.dart';

import '../models/building_model.dart';
import 'dormitory_3/vertexes_dormitory_3.dart';

List<Building> buildings =

[
  Building(const Uuid().v1(), "LNU Dormitory 3", 'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2Fdormitory_3.jpg?alt=media&token=83fb1ae9-3906-4f5a-ae96-01ed94919583',
      vertexesDormitory_3
      ),
  Building(const Uuid().v1(), "LNU Dormitory 2", 'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_2%2Fdormitory_2.jpg?alt=media&token=05826e91-256e-4fa7-bd55-4c4ee21e1789',
      vertexesDormitory_3
  ),
  Building(const Uuid().v1(), "LNU Dormitory 4", 'https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_4%2Fdormitory_4.jpg?alt=media&token=7f841362-5592-4da3-94d5-e970091f60fe',
      vertexesDormitory_3
  )
];




