
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';
import 'building_model.dart';

class AdminInfo{
  static Vertex vertex = Vertex.createEmpty();
  static Area area = Area.createEmpty();
  static Building building = Building.createEmpty();
  static Room room = Room(uid: '', title: '', vertexTitle: '');
  static VertexConnection connection = VertexConnection.createEmpty();
  static double x = 0;
  static double y = 0;
  static double direction = 0;
  static double size = 0;

  static void clear(){
    x = 0;
    y = 0;
    direction = 0;
    size = 0;
  }

  static void clearBuilding(){
    clear();
    building = Building.createEmpty();
  }

  static void clearArea(){
    clear();
    area = Area.createEmpty();
  }

  static void clearVertex(){
    clear();
    vertex = Vertex(title: '', rooms: [], vertexConnections: []);
  }

  static void clearRoom(){
    clear();
    room = Room(uid: '', title: '', vertexTitle: '');
  }

  static void clearConnection(){
    clear();
    connection = VertexConnection.createEmpty();
  }

  static void setRoomCoordinates(){
    room.titleX = x;
    room.titleY = y;
    room.direction = direction;
  }

  static void setConnectionCoordinates(){
    connection.iconX = x;
    connection.iconY = y;
    connection.direction = direction;
  }

  static void checkBuildingId(){
    if (building.uid.isEmpty == true){
      building.uid = const Uuid().v1();
    }
  }

  static setSize(String text){
    AdminInfo.size = text.length * 30;
  }
}