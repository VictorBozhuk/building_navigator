
import 'package:building_navigator/models/vertex_model.dart';

class VertexConnection {
  late String vertexTitle;
  late String vertexImagePath;
  late double direction;
  late double iconX;
  late double iconY;
  late double iconSize;
  late String iconPath; //----------
  late double length;

  VertexConnection(this.vertexTitle, this.vertexImagePath, this.direction, this.iconX, this.iconY, this.iconSize, this.iconPath, this.length);
}