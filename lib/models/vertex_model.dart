
import 'package:building_navigator/models/room_model.dart';

class Vertex {
  late String Title;
  late List<Room>? Rooms;
  late String imagePath;

  Vertex(this.Title, this.imagePath, {this.Rooms});

}