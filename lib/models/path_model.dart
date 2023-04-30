import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_model.dart';

import '../algorithm_new/building_navigator.dart';
import '../screens/functions/functions.dart';
import 'building_model.dart';

class PathInfo {
  static late Building building;
  static bool isReadyToGo = false;
  static List<Vertex>? listVertexes = [];
  static late Vertex? currentVertex;
  static late Vertex? nextVertex;
  static int _currentIndex = 0;

  static late Vertex? sourceVertex;
  static Room? destinationRoom = Room.empty("");

  static bool isWalk = false;

  static setSource(Room? room) => sourceVertex = room?.vertex;

  static setDestination(Room? room) => destinationRoom = room;

  static setVertexes(List<Vertex> vertexes){
    listVertexes = vertexes;
    currentVertex = vertexes[0];
    nextVertex = vertexes[1];
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

  static setNewVertexes(Vertex vertex){
    //currentVertex = listVertexes?.firstWhere((x) => x.id == vertex.id);
    //_currentIndex = listVertexes!.indexOf(currentVertex!);
    //nextVertex = listVertexes![1 + _currentIndex];
  }

  static void clear(){
    listVertexes?.clear();
    _currentIndex = 0;
    currentVertex = null;
    sourceVertex = null;
    nextVertex = null;
    destinationRoom = Room.empty("");
    isReadyToGo = false;
  }

  static Future<void> setPath(Building building) async {
    PathFinder client = PathFinder(await getEdges(building), await getAllVertexes(building));
    var VertexIds = client.GetPath(PathInfo.sourceVertex!.id, PathInfo.destinationRoom!.vertex.id);
    List<Vertex> vertexes = [];
    var allVertexes = await getAllVertexes(building);
    for(int i = 0; i < VertexIds!.length; ++i)
    {
      for(int j = 0; j < allVertexes.length; ++j)
      {
        if(VertexIds[i] == allVertexes[j].id)
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