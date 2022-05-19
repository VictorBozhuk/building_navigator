
import 'package:building_navigator/models/room_model.dart';
import 'package:building_navigator/models/vertex_model.dart';

import 'building_model.dart';

class PathInfo {
  static late String sourceRoom = '';
  static late String destinationRoom = '';
  static late String sourceVertex = '';
  static late String destinationVertex = '';
  static late List<Vertex>? listVertexes;
  static late Vertex currentVertex;
  static late String nextVertexImagePath;
  static late Building building;

  static late int _currentIndex = 0;

  static setSource(Room? room)
  {
    sourceRoom = room?.Title ?? '';
    sourceVertex = room?.vertex ?? '';
  }

  static setDestination(Room? room)
  {
    destinationRoom = room?.Title ?? '';
    destinationVertex = room?.vertex ?? '';
  }

  static setVertexes(List<Vertex> _listVertexes){
    listVertexes = _listVertexes;
    currentVertex = _listVertexes[0];
    try{
      nextVertexImagePath = _listVertexes[1 + _currentIndex].imagePath;
    }
    catch (e){}
  }

  static move(String nextImagePath){
    if(nextVertexImagePath == nextImagePath){
      if(_currentIndex + 2 != listVertexes?.length){
        currentVertex = listVertexes![++_currentIndex];
        nextVertexImagePath = listVertexes![1 + _currentIndex].imagePath;
      }
      else{
        currentVertex = listVertexes![++_currentIndex];
        nextVertexImagePath = destinationRoom;
      }
    }
  }

  static void clear(){
    sourceRoom = '';
    destinationRoom = '';
    sourceVertex = '';
    destinationVertex = '';
    listVertexes?.clear();
    _currentIndex = 0;
  }
}