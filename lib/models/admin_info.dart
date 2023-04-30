
import 'package:lnu_navigator/models/picture_size_model.dart';
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';
import 'building_model.dart';

class AdminInfo{
  static Vertex vertex = Vertex.empty("");
  static Area area = Area.empty("");
  static Building building = Building.empty();
  static Room room = Room.empty("");
  static VertexConnection connection = VertexConnection.empty("", "");
  static Vertex? selectedVertex;
  static Vertex? secondSelectedVertex;
  static bool isCreateAreaConnection = false;
  static Area areaConnection = Area.empty("");
  static Vertex? selectedVertexOnOtherArea;
  static PictureSize pictureSize = PictureSize.empty();

  static void clearBuilding(){
    building = Building.empty();
  }

  static void clearArea(){
    area = Area.empty("");
  }

  static void clearAreaConnection(){
    isCreateAreaConnection = false;
    areaConnection = Area.empty("");
    selectedVertexOnOtherArea = null;
  }

  static void clearVertex(){
    vertex = Vertex.empty("");
  }

  static void clearRoom(){
    room = Room.empty("");
  }

  static void clearConnection(){
    connection = VertexConnection.empty("", "");
  }

  static clearSelectedVertexes(){
    selectedVertex = null;
    secondSelectedVertex = null;
  }
}