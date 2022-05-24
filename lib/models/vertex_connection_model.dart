
import 'package:building_navigator/models/vertex_model.dart';

class VertexConnection {
  late String uid;
  late String vertexTitle;
  late String vertexImagePath;
  late double direction;
  late double iconX;
  late double iconY;
  late double iconSize;
  late String iconPath; //----------
  late double length;

  VertexConnection(this.uid, this.vertexTitle, this.vertexImagePath, this.direction, this.iconX, this.iconY, this.iconSize, this.iconPath, this.length);

  VertexConnection.fromJson(Map<String, dynamic> data) {
    vertexImagePath = data['vertexImagePath'];
    vertexTitle = data['vertexTitle'];
    direction = data['direction'];
    iconX = data['iconX'];
    iconY = data['iconY'];
    iconSize = data['iconSize'];
    iconPath = data['iconPath'];
    length = data['length'];
  }

  VertexConnection copy(){
    return VertexConnection(uid, vertexTitle, vertexImagePath, direction, iconX, iconY, iconSize, iconPath, length);
  }

  Map<String, dynamic> toMap(){
    return {
      "vertexTitle": vertexTitle,
      "vertexImagePath": vertexImagePath,
      "direction": direction,
      "iconX": iconX,
      "iconY": iconY,
      "iconSize": iconSize,
      "iconPath": iconPath,
      "length": length,
    };
  }
}