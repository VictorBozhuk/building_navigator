
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
  static Room room = Room.createEmpty();
  static VertexConnection connection = VertexConnection.createEmpty();
  static Vertex? selectedVertex;
  static Vertex? secondSelectedVertex;
  static bool isCreateAreaConnection = false;
  static Area areaConnection = Area.createEmpty();
  static Vertex? selectedVertexOnOtherArea;

  static void clearBuilding(){
    building = Building.createEmpty();
  }

  static void clearArea(){
    area = Area.createEmpty();
  }

  static void clearAreaConnection(){
    isCreateAreaConnection = false;
    areaConnection = Area.createEmpty();
    selectedVertexOnOtherArea = null;
  }

  static void clearVertex(){
    vertex = Vertex.createEmpty();
  }

  static void clearRoom(){
    room = Room.createEmpty();
  }

  static void clearConnection(){
    connection = VertexConnection.createEmpty();
  }

  static clearSelectedVertexes(){
    selectedVertex = null;
    secondSelectedVertex = null;
  }
}