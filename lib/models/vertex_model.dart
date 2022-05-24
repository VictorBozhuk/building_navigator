import 'package:building_navigator/models/room_model.dart';
import 'package:building_navigator/models/vertex_connection_model.dart';
import 'package:flutter/material.dart';


class Vertex {
  late String uid;
  late String title;
  late List<Room>? rooms = [];
  late String? imagePath;
  late List<VertexConnection>? vertexConnections = [];

  late Image imageWidget;
  Vertex(this.uid, this.title, {this.imagePath, this.rooms, this.vertexConnections});

  String getImagePath() {
    return imagePath ?? '';
  }

  void loadImage(){
    imageWidget = Image.network(imagePath ?? '');
  }

  Vertex.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    imagePath = data['imagePath'];
    //var t = (data['rooms'] as List).map((w) => Room.fromJson(w)).toList();
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

    return Vertex(uid, title, rooms: copiedRooms, vertexConnections: copiedVertexConnections, imagePath:  imagePath);
  }

  Map<String, dynamic> toMap(){
    return {
      "title": title,
      "imagePath": imagePath,
      "vertexConnections": vertexConnections?.map((w) => w.toMap()).toList(),
      "rooms": rooms?.map((w) => w.toMap()).toList()
    };
  }
}