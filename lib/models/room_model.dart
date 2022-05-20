
import 'package:building_navigator/models/vertex_model.dart';

class Room {
  late String title;
  late String vertexTitle;
  late double? titleX;
  late double? titleY;
  late double? direction;
  Room(this.title, this.vertexTitle);

  Room.setAll(this.title, this.vertexTitle, this.titleX, this.titleY, this.direction);

  void setCoordination(double x, double y, double direction){
    titleX = x;
    titleY = y;
    this.direction = direction;
  }
}