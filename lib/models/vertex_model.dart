import 'package:building_navigator/models/room_model.dart';
import 'package:building_navigator/models/vertex_connection_model.dart';

class Vertex {
  late String title;
  late List<Room>? rooms = [];
  late String? imagePath;
  late List<VertexConnection>? vertexConnections = [];

  Vertex(this.title, {this.imagePath, this.rooms, this.vertexConnections});

  String getImagePath() {
    return imagePath ?? '';
  }

  Vertex copy(){
    var copiedRooms = rooms?.map((w) => w.copy()).toList();
    var copiedVertexConnections = vertexConnections?.map((w) => w.copy()).toList();

    return Vertex(title, rooms: copiedRooms, vertexConnections: copiedVertexConnections, imagePath:  imagePath);
  }

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "imagePath": imagePath,
      "vertexConnections": vertexConnections?.map((w) => w.toMap()).toList(),
      "rooms": rooms?.map((w) => w.toMap()).toList()
    };
  }
}