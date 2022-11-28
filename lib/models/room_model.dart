import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Room extends Comparable<Room> {
  late String uid;
  late String title;
  late String vertexTitle;
  late Vertex vertex;
  late double titleX = 0;
  late double titleY = 0;
  late double direction = 0;
  Room({required this.uid, required this.title, required this.vertexTitle});

  Room.setAll(this.uid, this.title, this.vertexTitle, this.titleX, this.titleY, this.direction);
  Room.createEmpty(){
    uid = const Uuid().v1();
    title = "";
    vertexTitle = "";
    vertex = Vertex.createEmpty();
    titleX = 0;
    titleY = 0;
    direction = 0;
  }
  void setCoordination(double x, double y, double direction){
    titleX = x;
    titleY = y;
    this.direction = direction;
  }

  @override
  int compareTo(Room other) {
    return title == other.title ? 1 : 0;
  }

  Room.fromJson(Map<String, dynamic> data) {
    uid = data["uid"];
    title = data['title'];
    vertexTitle = data['vertexTitle'];
    titleX = data['titleX'];
    titleY = data['titleY'];
    direction = data['direction'];
    vertex = Vertex.fromJsonForConnection(data["vertex"]);
  }

  Room copy(){
    return Room.setAll(uid, title, vertexTitle, titleX, titleY, direction);
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "title": title,
      "vertexTitle": vertexTitle,
      "titleX": titleX,
      "titleY": titleY,
      "direction": direction,
      "vertex" : vertex.toMapForConnection(),
    };
  }
}