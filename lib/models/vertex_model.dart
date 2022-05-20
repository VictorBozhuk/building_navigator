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
}