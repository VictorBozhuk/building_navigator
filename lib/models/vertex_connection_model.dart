import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class VertexConnection {
  late String uid;
  late double direction;
  late double iconX;
  late double iconY;
  late double iconSize = 100;
  late int iconAngle = 0;
  late double length;
  late Vertex nextVertex;

  VertexConnection(this.nextVertex, this.direction, this.iconX, this.iconY, this.iconSize, this.length, this.iconAngle){
    uid = const Uuid().v1();
  }
  VertexConnection.createEmpty(){
    uid = const Uuid().v1();
    nextVertex = Vertex.createEmpty();
    direction = 0;
    iconX = 0;
    iconY = 0;
    iconSize = 0;
    iconAngle = 0;
    length = 0;
  }

  VertexConnection.fromJson(Map<String, dynamic> data) {
    uid = data['uid'];
    nextVertex = Vertex.fromJsonForConnection(data['nextVertex']);
    direction = data['direction'];
    iconX = data['iconX'];
    iconY = data['iconY'];
    iconSize = data['iconSize'];
    length = data['length'];
    iconAngle = data['iconAngle'] ?? 0;
  }

  VertexConnection copy(){
    return VertexConnection(nextVertex, direction, iconX, iconY, iconSize, length, iconAngle);
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "nextVertex": nextVertex.toMapForConnection(),
      "direction": direction,
      "iconX": iconX,
      "iconY": iconY,
      "iconSize": iconSize,
      "length": length,
      'iconAngle': iconAngle,
    };
  }
}