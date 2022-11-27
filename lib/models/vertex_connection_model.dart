import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class VertexConnection {
  late String uid;
  late double direction;
  late double iconX;
  late double iconY;
  late double iconSize;
  late String iconPath;
  late double length;
  late Vertex nextVertex;

  VertexConnection(this.nextVertex, this.direction, this.iconX, this.iconY, this.iconSize, this.iconPath, this.length){
    uid = const Uuid().v1();
  }
  VertexConnection.createEmpty(){
    uid = const Uuid().v1();
    nextVertex = Vertex.createEmpty();
    direction = 0;
    iconX = 0;
    iconY = 0;
    iconSize = 0;
    iconPath = 'assets/icons/point.png';
    length = 0;
  }

  VertexConnection.fromJson(Map<String, dynamic> data) {
    nextVertex = data['nextVertex'];
    direction = data['direction'];
    iconX = data['iconX'];
    iconY = data['iconY'];
    iconSize = data['iconSize'];
    iconPath = data['iconPath'];
    length = data['length'];
  }

  VertexConnection copy(){
    return VertexConnection(nextVertex, direction, iconX, iconY, iconSize, iconPath, length);
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "nextVertex": nextVertex,
      "direction": direction,
      "iconX": iconX,
      "iconY": iconY,
      "iconSize": iconSize,
      "iconPath": iconPath,
      "length": length,
    };
  }
}