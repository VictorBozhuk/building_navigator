import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';

class Vertex {
  late final String id;
  late String? title;
  late List<Room>? rooms = [];
  late String? panoramaImagePath;
  late List<VertexConnection>? vertexConnections = [];
  late double? pointX;
  late double? pointY;
  late double? map2DWidth;
  late double? map2DHeight;
  late Area? areaConnection;

  Vertex({ this.title,
        this.panoramaImagePath,
        this.rooms,
        this.pointX,
        this.pointY,
        this.map2DWidth,
        this.map2DHeight,
        this.vertexConnections}){
    id = const Uuid().v1();
  }

  Vertex.createOnlyPoint(this.pointX, this.pointY, this.map2DWidth, this.map2DHeight,){
    id = const Uuid().v1();
    title = null;
    panoramaImagePath = null;
    rooms = [];
    vertexConnections = [];
    areaConnection = null;
  }

  Vertex.createEmpty(){
    id = const Uuid().v1();
    title = "";
    panoramaImagePath = "";
    rooms = [];
    pointX = 0;
    pointY = 0;
    map2DWidth = 0;
    map2DHeight = 0;
    vertexConnections = [];
    areaConnection = null;
  }

  bool isFullInfo(){
    if(title == null || (title?.isEmpty ?? true)
    || panoramaImagePath == null || (panoramaImagePath?.isEmpty ?? true)){
      return false;
    }

    return true;
  }

  Vertex.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data['title'];
    panoramaImagePath = data['panoramaImagePath'];
    pointX = data['pointX'];
    pointY = data['pointY'];
    areaConnection = data['areaConnection'] == null
        ? null : Area.fromJson(data['areaConnection']);
    map2DWidth = data['map2DWidth'];
    map2DHeight = data['map2DHeight'];
    if(data['rooms'] == null){
      rooms = [];
    }else{
      rooms = (data['rooms'] as List).map((w) => Room.fromJson(w)).toList();
    }

    if(data['vertexConnections'] == null){
      vertexConnections = [];
    }else{
      vertexConnections = (data['vertexConnections']
        as List).map((w) => VertexConnection.fromJson(w)).toList();
    }
  }

  Vertex.fromJsonForConnection(Map<String, dynamic> data) {
    id = data["id"];
    title = data['title'];
    panoramaImagePath = data['panoramaImagePath'];
    pointX = data['pointX'];
    pointY = data['pointY'];
    map2DWidth = data['map2DWidth'];
    map2DHeight = data['map2DHeight'];
    areaConnection = data['areaConnection'] == null
        ? null : Area.fromJson(data["areaConnection"]);
    rooms = [];
    vertexConnections = [];
  }

  Vertex copy(){
    var copiedRooms = rooms?.map((w) => w.copy()).toList();
    var copiedVertexConnections = vertexConnections?.map((w) => w.copy()).toList();

    return Vertex(title: title, rooms: copiedRooms, vertexConnections: copiedVertexConnections, panoramaImagePath:  panoramaImagePath);
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "panoramaImagePath": panoramaImagePath,
      "vertexConnections": vertexConnections?.map((w) => w.toMap()).toList(),
      "rooms": rooms?.map((w) => w.toMap()).toList(),
      "pointX" : pointX,
      "pointY" : pointY,
      "map2DWidth" : map2DWidth,
      "map2DHeight" : map2DHeight,
      "areaConnection" : areaConnection?.toMapForConnection(),
    };
  }

  Map<String, dynamic> toMapForConnection(){
    return {
      "id" : id,
      "title": title,
      "panoramaImagePath": panoramaImagePath,
      "pointX" : pointX,
      "pointY" : pointY,
      "map2DWidth" : map2DWidth,
      "map2DHeight" : map2DHeight,
      "areaConnection" : areaConnection?.toMapForConnection(),
    };
  }
}