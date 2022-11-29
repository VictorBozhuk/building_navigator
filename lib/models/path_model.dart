import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';

import '../algorithm_new/building_navigator.dart';
import 'building_model.dart';

class PathInfo {
  static late Building building;
  static bool isReadyToGo = false;
  static List<Vertex>? listVertexes = [];
  static late Vertex? currentVertex;
  static late Vertex? nextVertex;
  static int _currentIndex = 0;

  static late Vertex? sourceVertex;
  static Room? destinationRoom = Room.createEmpty();

  static bool isWalk = false;

  static setSource(Room? room) => sourceVertex = room?.vertex;

  static setDestination(Room? room) => destinationRoom = room;

  static setVertexes(List<Vertex> _listVertexes){
    listVertexes = _listVertexes;
    currentVertex = _listVertexes[0];
    nextVertex = _listVertexes[1];
  }

  static move(){
    if(isWalk == false){
      if(_currentIndex + 2 != listVertexes?.length){
        currentVertex = listVertexes![++_currentIndex];
        nextVertex = listVertexes![1 + _currentIndex];
      }
      else{
        currentVertex = listVertexes![++_currentIndex];
      }
    }
  }

  static void clear(){
    listVertexes?.clear();
    _currentIndex = 0;
    currentVertex = null;
    sourceVertex = null;
    nextVertex = null;
    destinationRoom = Room.createEmpty();
    isReadyToGo = false;
  }

  static void setPath(Building building){
    BuildingNavigator client = BuildingNavigator(building.getEdges(), building.getAllVertexes());
    var VertexIds = client.GetPath(PathInfo.sourceVertex!.uid, PathInfo.destinationRoom!.vertex.uid);
    List<Vertex> vertexes = [];
    var allVertexes = building.getAllVertexes();
    for(int i = 0; i < VertexIds!.length; ++i)
    {
      for(int j = 0; j < allVertexes.length; ++j)
      {
        if(VertexIds[i] == allVertexes[j].uid)
        {
          vertexes.add(allVertexes[j]);
          break;
        }
      }
    }
    PathInfo.isReadyToGo = true;
    PathInfo.setVertexes(vertexes);
  }
}