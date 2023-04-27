import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';

class Vertex {
  late String id;
  late String areaId;
  late String? areaConnectionId;
  late String? title;
  late String? panoramaImagePath;
  late double? pointX;
  late double? pointY;
  late double? areaWidth;
  late double? areaHeight;

  late Area? areaConnection;
  late List<Room>? rooms;
  late List<VertexConnection>? vertexConnections;

  Vertex(this.areaId, {
    this.title,
    this.panoramaImagePath,
    this.rooms,
    this.pointX,
    this.pointY,
    this.areaWidth,
    this.areaHeight,
    this.areaConnectionId,
    this.vertexConnections}){
    id = const Uuid().v1();
  }

  Vertex.point(this.areaId, this.pointX, this.pointY, this.areaWidth, this.areaHeight){
    id = const Uuid().v1();
    title = null;
    panoramaImagePath = null;
    rooms = [];
    vertexConnections = [];
    areaConnectionId = null;
    areaConnection = null;
  }

  Vertex.empty(this.areaId){
    id = const Uuid().v1();
    title = "";
    panoramaImagePath = "";
    pointX = 0;
    pointY = 0;
    areaWidth = 0;
    areaHeight = 0;
    vertexConnections = [];
    rooms = [];
    areaConnectionId = null;
    areaConnection = null;
  }

  bool isFullInfo(){
    if(title == null
      || (title?.isEmpty ?? true)
      || panoramaImagePath == null
      || (panoramaImagePath?.isEmpty ?? true)){
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
    areaWidth = data['areaWidth'];
    areaHeight = data['areaHeight'];
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

  //
  // Why copy?
  //
  Vertex copy(){
    return Vertex(areaId, title: title, panoramaImagePath:  panoramaImagePath, );
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
      "areaWidth" : areaWidth,
      "areaHeight" : areaHeight,
    };
  }
}