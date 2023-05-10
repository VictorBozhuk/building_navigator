
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';
import 'building_model.dart';

class UserInfo {
  static Vertex vertex = Vertex.empty("");
  static Area area = Area.empty("");
  static Building building = Building.empty();
  static Room room = Room.empty("");
  static VertexConnection connection = VertexConnection.empty("", "");
  static double x = 0;
  static double y = 0;
  static double direction = 0;
  static double size = 0;
  static Vertex? selectedVertex;
  static Vertex? secondSelectedVertex;
  static bool isCreateAreaConnection = false;
  static Area areaConnection = Area.empty("");
  static Vertex? selectedVertexOnOtherArea;

  static void clear() {
    x = 0;
    y = 0;
    direction = 0;
    size = 0;
  }

  static void clearBuilding() {
    clear();
    building = Building.empty();
  }

  static void clearArea() {
    clear();
    area = Area.empty("");
  }

  static void clearAreaConnection() {
    isCreateAreaConnection = false;
    areaConnection = Area.empty("");
    selectedVertexOnOtherArea = null;
  }

  static void clearVertex() {
    clear();
    vertex = Vertex.empty("");
  }

  static void clearRoom() {
    clear();
    room = Room.empty("");
  }

  static void clearConnection() {
    clear();
    connection = VertexConnection.empty("", "");
  }

  static void setRoomCoordinates() {
    room.titleX = x;
    room.titleY = y;
    room.direction = direction;
  }

  static void setConnectionCoordinates() {
    connection.iconX = x;
    connection.iconY = y;
    connection.direction = direction;
  }

  static void checkBuildingId() {
    if (building.id.isEmpty == true) {
      building.id = const Uuid().v1();
    }
  }

  static setSize(String text) {
    size = text.length * 30;
  }

  static clearSelectedVertexes() {
    selectedVertex = null;
    secondSelectedVertex = null;
  }
}