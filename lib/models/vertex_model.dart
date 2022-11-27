import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/room_model.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';
import 'package:uuid/uuid.dart';

class Vertex {
  late final String uid;
  late String? title;
  late List<Room>? rooms = [];
  late String? panoramaImagePath;
  late List<VertexConnection>? vertexConnections = [];
  late double? pointX;
  late double? pointY;
  late String? map2DPath;
  late double? map2DWidth;
  late double? map2DHeight;
  late Image imageWidget;

  Vertex({ this.title,
        this.panoramaImagePath,
        this.rooms,
        this.pointX,
        this.pointY,
        this.map2DPath,
        this.map2DWidth,
        this.map2DHeight,
        this.vertexConnections}){
    uid = const Uuid().v1();
  }

  String getImagePath() {
    return panoramaImagePath ?? '';
  }

  void loadImage(){
    imageWidget = Image.network(panoramaImagePath ?? '');
  }

  Vertex.fromJson(Map<String, dynamic> data) {
    uid = data["uid"];
    title = data['title'];
    panoramaImagePath = data['panoramaImagePath'];
    pointX = data['pointX'];
    pointY = data['pointY'];
    map2DPath = data['map2DPath'];
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
      vertexConnections = (data['vertexConnections'] as List).map((w) => VertexConnection.fromJson(w)).toList();
    }
  }

  Vertex copy(){
    var copiedRooms = rooms?.map((w) => w.copy()).toList();
    var copiedVertexConnections = vertexConnections?.map((w) => w.copy()).toList();

    return Vertex(title: title, rooms: copiedRooms, vertexConnections: copiedVertexConnections, panoramaImagePath:  panoramaImagePath);
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "title": title,
      "panoramaImagePath": panoramaImagePath,
      "vertexConnections": vertexConnections?.map((w) => w.toMap()).toList(),
      "rooms": rooms?.map((w) => w.toMap()).toList(),
      "pointX" : pointX,
      "pointY" : pointY,
      "map2DPath" : map2DPath,
      "map2DWidth" : map2DWidth,
      "map2DHeight" : map2DHeight,
    };
  }
}