import 'package:building_navigator/models/room_model.dart';
import 'package:building_navigator/models/vertex_model.dart';

import 'building_model.dart';

class PathInfo {
  static late String sourceRoomTitle = '';
  static late String destinationRoomTitle = '';
  static late String sourceVertexTitle = '';
  static late String destinationVertexTitle = '';
  static late List<Vertex>? listVertexes = [];
  static late Vertex currentVertex;
  static late String nextVertexImagePath = '';
  static late Building building;
  static late int _currentIndex = 0;

  static late bool isWalk = false;

  static setSource(Room? room)
  {
    sourceRoomTitle = room?.title ?? '';
    sourceVertexTitle = room?.vertexTitle ?? '';
  }

  static setDestination(Room? room)
  {
    destinationRoomTitle = room?.title ?? '';
    destinationVertexTitle = room?.vertexTitle ?? '';
  }

  static setVertexes(List<Vertex> _listVertexes){
    listVertexes = _listVertexes;
    currentVertex = _listVertexes[0];
    try{
      nextVertexImagePath = _listVertexes[1 + _currentIndex].imagePath ?? '';
    }
    catch (e){}
  }

  static move(String nextImagePath){
    if(isWalk == false && nextImagePath.isEmpty == false && nextVertexImagePath == nextImagePath){
      if(_currentIndex + 2 != listVertexes?.length){
        currentVertex = listVertexes![++_currentIndex];
        nextVertexImagePath = listVertexes![1 + _currentIndex].imagePath ?? '';
      }
      else{
        currentVertex = listVertexes![++_currentIndex];
        nextVertexImagePath = destinationRoomTitle;
      }
    }
  }

  static void clear(){
    sourceRoomTitle = '';
    destinationRoomTitle = '';
    sourceVertexTitle = '';
    destinationVertexTitle = '';
    //nextVertexImagePath = '';
    listVertexes?.clear();
    _currentIndex = 0;
  }

  static String getVertexImagePath(){
    for (int i = 0; i < building.vertexes.length; ++i)
      {
        if(sourceVertexTitle == building.vertexes[i].title)
          {
            return building.vertexes[i].imagePath ?? "";
          }
      }

    return "";
  }
}