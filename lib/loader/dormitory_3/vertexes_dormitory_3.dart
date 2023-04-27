import 'package:lnu_navigator/loader/dormitory_3/rooms_dormitory_3.dart';
import 'package:uuid/uuid.dart';
import '../../../models/vertex_model.dart';
import '../../models/vertex_connection_model.dart';

const String p704_706 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F704-706.jpg?alt=media&token=06e12065-392a-4e60-926b-2370b86617b9";
const String p707 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F707.jpg?alt=media&token=25ac14c5-cb8f-48f4-a68c-2dd16c7379dd";
const String p701_707 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F701-707.jpg?alt=media&token=60e83ac6-f33f-4ad4-80b0-44c97a0607a5";
const String p701_703 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F701-703.jpg?alt=media&token=a0bc9474-7c02-408d-97d3-158e10dfd557";
const String p701A = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F701%D0%90.jpg?alt=media&token=3993d0e2-3501-4698-8990-ee5519baead2";
const String p714A = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F714%D0%90.jpg?alt=media&token=c7552f75-5b66-45a1-b161-33bea4803df7";
const String p714 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F714.jpg?alt=media&token=ff2885d2-30ae-4a6e-8853-d26e8cf639e7";
const String p711_713 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F711-713.jpg?alt=media&token=65cbf12b-9a95-4421-bbba-0c9efdf2f761";
const String p708_710 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F708-710.jpg?alt=media&token=6adc45b2-3cc2-45db-9038-b1ed56f7962c";
const String p701_707b = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F701-707b.jpg?alt=media&token=d7390268-68d0-4dd4-ba98-ba240d1fdc5e";
const String p7 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F7%2F7.jpg?alt=media&token=77e15cca-1303-4e31-96a3-9bc7707e4071";
const String p6_7 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6-7.jpg?alt=media&token=a9473f0d-ae4f-43cd-9ee6-effaa176c2b0";
const String p7_8 = "https://firebasestorage.googleapis.com/v0/b/buildingnavigator-b16ab.appspot.com/o/dormitory_3%2F6-7.jpg?alt=media&token=a9473f0d-ae4f-43cd-9ee6-effaa176c2b0";


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
const String t7 = "7";
const String t6_7 = "6_7";
const String t7_8 = "7_8";

/*
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
  v7,
  v6_7,
  v7_8,
];

Vertex v704_706 = Vertex(title: t704_706,panoramaImagePath: p704_706,
    rooms: [ r704, r705, r706],
    vertexConnections: [
      VertexConnection(v707, 11, 115, -13, 100, 3, 0),
      VertexConnection(v701_707b, 5, -100, 0, 100, 5, 0),
    ]);

Vertex v707 = Vertex(title: t707, panoramaImagePath: p707,
    rooms: [r707],
    vertexConnections: [
      VertexConnection(v704_706, -2, -105, 0, 100, 3, 0),
      VertexConnection(v701_707, 11, 120, -15, 100, 3, 0)
    ]);

Vertex v701_707 = Vertex(title: t701_707, panoramaImagePath: p701_707,
    vertexConnections: [
  VertexConnection(v707, -1, 337, -16, 100, 3, 0),
  VertexConnection(v701_703, -2, 267, -5, 100, 5, 0),
  VertexConnection(v701A, 19, 105, -10, 150, 5, 0),
]);

Vertex v701_703 = Vertex(title: t701_703, panoramaImagePath: p701_703,
    rooms: [ r701, r702, r703],
    vertexConnections: [
      VertexConnection(v701_707, -11, -95, -10, 100, 5, 0),
      VertexConnection(v701_707b, 11, 105, 0, 100, 5, 0)
    ]);

Vertex v701A = Vertex(title: t701A, panoramaImagePath: p701A,
    rooms: [ r701A ],
    vertexConnections: [
      VertexConnection(v701_707, -2, -86, -10, 100, 5, 0),
      VertexConnection(v714A, 2, 92, -10, 100, 5, 0),
      VertexConnection(v7, 0, 10, -20, 160, 5, 0),

    ]);

Vertex v714A = Vertex(title: t714A, panoramaImagePath: p714A,
    rooms: [ r714A ],
    vertexConnections: [
      VertexConnection(v714, 12, 163, -18, 100, 3, 0),
      VertexConnection(v701A, -2, -80, -13, 100, 5, 0),
      VertexConnection(v708_710, 2, 85, -8, 100, 5, 0)
    ]);

Vertex v714 = Vertex(title: t714, panoramaImagePath: p714,
    rooms: [ r714 ],
    vertexConnections: [
      VertexConnection(v714A, 11, 123, -20, 120, 3, 0),
      VertexConnection(v711_713, -11, 253, -10, 100, 3, 0)
    ]);

Vertex v711_713 = Vertex(title: t711_713, panoramaImagePath: p711_713,
    rooms: [ r711, r712, r713 ],
    vertexConnections: [
      VertexConnection(v714, 11, 120, -17, 100, 3, 0)
    ]);

Vertex v708_710 = Vertex(title: t708_710, panoramaImagePath: p708_710,
    rooms: [ r708, r709, r710 ],
    vertexConnections: [
      VertexConnection(v714A, -11, -103, -10, 100, 5, 0)
    ]);

Vertex v701_707b = Vertex(title: t701_707b, panoramaImagePath: p701_707b,
    vertexConnections: [
  VertexConnection(v704_706, 0, 155, 10, 140, 5, 0),
  VertexConnection(v701_703, 0, -115, 10, 140, 5, 0),
]);

Vertex v7 = Vertex(title: t7, panoramaImagePath: p7,
    vertexConnections: [
      VertexConnection(v701A, 4, 190, -20, 140, 5, 0),
      VertexConnection(v6_7, 0, -5, -25, 120, 5, 0),
      VertexConnection(v6_7, 0, 15, 6, 120, 5, 0),
    ]);

Vertex v6_7 = Vertex(title: t6_7, panoramaImagePath: p6_7,
    vertexConnections: [
      VertexConnection(v7, 0, 20, 8, 120, 5, 0),
      VertexConnection(v7, 0, -5, -28, 120, 5, 0),
    ]);

Vertex v7_8 = Vertex(title: t7_8, panoramaImagePath: p7_8,
    vertexConnections: [
      VertexConnection(v7, 0, 40, 60, 70, 5, 0),
    ]);

*/



