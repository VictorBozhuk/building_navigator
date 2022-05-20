import 'package:building_navigator/loader/dormitory_3/rooms_dormitory_3.dart';
import 'package:building_navigator/models/vertex_connection_model.dart';
import 'package:building_navigator/models/vertex_model.dart';
import '../../../models/vertex_model.dart';

List<Vertex> vertexesDormitory_3 = [
  // 7
  v704_706,
  v707,
  v701_707,
  v701_703,
  v701A,
  v714A,
  v714,
  v711_713,
  v708_710,
  v701_707b,
];

var v704_706 = Vertex(t704_706,imagePath: p704_706,
    rooms: [ r704, r705, r706],
    vertexConnections: [
      VertexConnection(t707, p707, 11, 115, -13, 100, "assets/icons/point.png", 3),
      VertexConnection(t701_707b, p701_707b, 5, -100, 0, 100, "assets/icons/open_door.png", 5),
    ]);

var v707 = Vertex(t707, imagePath: p707,
    rooms: [r707],
    vertexConnections: [
      VertexConnection(t704_706, p704_706, -2, -105, 0, 100, "assets/icons/point.png", 3),
      VertexConnection(t701_707, p701_707, 11, 120, -15, 100, "assets/icons/point.png", 3)
    ]);

var v701_707 = Vertex(t701_707, imagePath: p701_707,
    vertexConnections: [
  VertexConnection(t707, p707, -1, 337, -16, 100, "assets/icons/point.png", 3),
  VertexConnection(t701_703, p701_703, -2, 267, -5, 100, "assets/icons/point.png", 5),
  VertexConnection(t701A, p701A, 19, 105, -10, 150, "assets/icons/point.png", 5),
]);

var v701_703 = Vertex(t701_703, imagePath: p701_703,
    rooms: [ r701, r702, r703],
    vertexConnections: [
      VertexConnection(t701_707, p701_707, -11, -95, -10, 100, "assets/icons/point.png", 5),
      VertexConnection(t701_707b, p701_707b, 11, 105, 0, 100, "assets/icons/open_door.png", 5)
    ]);

var v701A = Vertex(t701A, imagePath: p701A,
    rooms: [ r701A ],
    vertexConnections: [
      VertexConnection(t701_707, p701_707, -2, -86, -10, 100, "assets/icons/point.png", 5),
      VertexConnection(t714A, p714A, 2, 92, -10, 100, "assets/icons/point.png", 5)
    ]);

var v714A = Vertex(t714A, imagePath: p714A,
    rooms: [ r714A ],
    vertexConnections: [
      VertexConnection(t714, p714, 12, 163, -18, 100, "assets/icons/point.png", 3),
      VertexConnection(t701A, p701A, -2, -80, -13, 100, "assets/icons/point.png", 5),
      VertexConnection(t708_710, p708_710, 2, 85, -8, 100, "assets/icons/point.png", 5)
    ]);

var v714 = Vertex(t714, imagePath: p714,
    rooms: [ r714 ],
    vertexConnections: [
      VertexConnection(t714A, p714A, 11, 123, -20, 120, "assets/icons/point.png", 3),
      VertexConnection(t711_713, p711_713, -11, 253, -10, 100, "assets/icons/point.png", 3)
    ]);

var v711_713 = Vertex(t711_713, imagePath: p711_713,
    rooms: [ r711, r712, r713 ],
    vertexConnections: [
      VertexConnection(t714, p714, 11, 120, -17, 100, "assets/icons/point.png", 3)
    ]);

var v708_710 = Vertex(t708_710, imagePath: p708_710,
    rooms: [ r708, r709, r710 ],
    vertexConnections: [
      VertexConnection(t714A, p714A, -11, -103, -10, 100, "assets/icons/point.png", 5)
    ]);

var v701_707b = Vertex(t701_707b, imagePath: p701_707b,
    vertexConnections: [
  VertexConnection(t704_706, p704_706, 0, 155, 10, 140, "assets/icons/open_door.png", 5),
  VertexConnection(t701_703, p701_703, 0, -115, 10, 140, "assets/icons/open_door.png", 5),
]);

const String p704_706 = "assets/dormitory_3/7/704-706.jpg";
const String p707 = "assets/dormitory_3/7/707.jpg";
const String p701_707 = "assets/dormitory_3/7/701-707.jpg";
const String p701_703 = "assets/dormitory_3/7/701-703.jpg";
const String p701A = "assets/dormitory_3/7/701А.jpg";
const String p714A = "assets/dormitory_3/7/714А.jpg";
const String p714 = "assets/dormitory_3/7/714.jpg";
const String p711_713 = "assets/dormitory_3/7/711-713.jpg";
const String p708_710 = "assets/dormitory_3/7/708-710.jpg";
const String p701_707b = "assets/dormitory_3/7/701-707b.jpg";

const String t704_706 = "704-706";
const String t707 = "707";
const String t701_707 = "701-707";
const String t701_703 = "701-703";
const String t701_707b = "701-707b";
const String t701A = "701А";
const String t714A = "714А";
const String t714 = "714";
const String t711_713 = "711-713";
const String t708_710 = "708-710";
