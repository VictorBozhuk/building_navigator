import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class VertexConnection {
  late String id;
  late String vertexId;
  late String nextVertexId;
  late double direction;
  late double iconX;
  late double iconY;
  late double iconSize;
  late int iconAngle;
  late double length;

  late Vertex? nextVertex;

  VertexConnection(this.vertexId, this.nextVertexId, this.direction, this.iconX, this.iconY, this.iconSize, this.length, this.iconAngle){
    id = const Uuid().v1();
  }
  VertexConnection.empty(){
    id = const Uuid().v1();
    nextVertex = null;
    direction = 0;
    iconX = 0;
    iconY = 0;
    iconSize = 100;
    iconAngle = 0;
    length = 0;
  }

  VertexConnection.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    vertexId = data['vertexId'];
    nextVertexId = data['nextVertexId'];
    direction = data['direction'];
    iconX = data['iconX'];
    iconY = data['iconY'];
    iconSize = data['iconSize'];
    length = data['length'];
    iconAngle = data['iconAngle'] ?? 0;
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "vertexId" : vertexId,
      "nextVertexId" : nextVertexId,
      "direction": direction,
      "iconX": iconX,
      "iconY": iconY,
      "iconSize": iconSize,
      "length": length,
      'iconAngle': iconAngle,
    };
  }
}