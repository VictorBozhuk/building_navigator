import 'package:building_navigator/loader/dormitory_3/rooms_dormitory_3.dart';
import 'package:building_navigator/loader/dormitory_3/vertexes_path_dormitory_3.dart';
import 'package:building_navigator/models/vertex_model.dart';
import '../../models/room_model.dart';
import '../../../models/room_model.dart';
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

var v704_706 = Vertex("704-706", p704_706,
    Rooms: [
      Room(r704, _getTitle(p704_706)),
      Room(r705, _getTitle(p704_706)),
      Room(r706, _getTitle(p704_706))]);

var v707 = Vertex("707", p707,
    Rooms: [
      Room(r707, _getTitle(p707))]);

var v701_707 = Vertex("701-707", p701_707);

var v701_703 = Vertex("701-703", p701_703,
    Rooms: [
      Room(r701, _getTitle(p701_703)),
      Room(r702, _getTitle(p701_703)),
      Room(r703, _getTitle(p701_703))]);

var v701A = Vertex("701А", p701A,
    Rooms: [
      Room(r701A, _getTitle(p701A))]);

var v714A = Vertex("714А", p714A,
    Rooms: [
      Room(r714A, _getTitle(p714A))]);

var v714 = Vertex("714", p714,
    Rooms: [
      Room(r714, _getTitle(p714))]);

var v711_713 = Vertex("711-713", p711_713,
    Rooms: [
      Room(r711, _getTitle(p711_713)),
      Room(r712, _getTitle(p711_713)),
      Room(r713, _getTitle(p711_713))]);

var v708_710 = Vertex("708-710", p708_710,
    Rooms: [
      Room(r708, _getTitle(p708_710)),
      Room(r709, _getTitle(p708_710)),
      Room(r710, _getTitle(p708_710))]);

var v701_707b = Vertex("701-707b", p701_707b);

String _getTitle(String path)
{
  var spliteBySlash = path.split('/');
  return spliteBySlash[spliteBySlash.length - 1].split('.')[0];
}