import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:uuid/uuid.dart';

import 'area_model.dart';

class Vertex {
  late String id;
  late String areaId;
  late String? areaConnectionId;
  late String title;
  late String panoramaImagePath;
  late double pointX;
  late double pointY;
  late double areaWidth;
  late double areaHeight;
  late List<Room> rooms;
  late List<VertexConnection> vertexConnections;

  late Area? areaConnection;

  Vertex(this.areaId, {
    required this.title,
    required this.panoramaImagePath,
    required this.rooms,
    required this.pointX,
    required this.pointY,
    required this.areaWidth,
    required this.areaHeight,
    this.areaConnectionId,
    required this.vertexConnections}){
    id = const Uuid().v1();
  }

  Vertex.point(this.areaId, this.pointX, this.pointY, this.areaWidth, this.areaHeight){
    id = const Uuid().v1();
    title = '';
    panoramaImagePath = '';
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
    if(title.isEmpty || panoramaImagePath.isEmpty){
      return false;
    }

    return true;
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "areaId" : areaId,
      "areaConnectionId" : areaConnectionId,
      "title": title,
      "panoramaImagePath": panoramaImagePath,
      "vertexConnections": vertexConnections.map((w) => w.toMap()).toList(),
      "rooms": rooms.map((w) => w.toMap()).toList(),
      "pointX" : pointX,
      "pointY" : pointY,
      "areaWidth" : areaWidth,
      "areaHeight" : areaHeight,
    };
  }

  Vertex.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    areaId = data["areaId"];
    areaConnectionId = data["areaConnectionId"];
    title = data['title'];
    panoramaImagePath = data['panoramaImagePath'];
    pointX = data['pointX'];
    pointY = data['pointY'];
    areaWidth = data['areaWidth'];
    areaHeight = data['areaHeight'];
    rooms = (data['rooms'] as List).map((w) => Room.fromJson(w)).toList();
    vertexConnections = (data['vertexConnections']
        as List).map((w) => VertexConnection.fromJson(w)).toList();
  }

  //
  // Why copy?
  //
  //Vertex copy(){
  //  return Vertex(areaId, title: title, panoramaImagePath:  panoramaImagePath, );
  //}

}