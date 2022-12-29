import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Room extends Comparable<Room> {
  late String uid;
  late String title;
  late Vertex vertex;
  late double titleX = 0;
  late double titleY = 0;
  late double direction = 0;
  late double fontSize = 18;
  late double titleBoxWidth = 100;
  late double titleBoxHeight = 100;
  late Color color = Colors.red;
  Room({required this.uid, required this.title});

  Room.setAll(this.uid, this.title, this.titleX, this.titleY, this.direction);
  Room.createEmpty(){
    uid = const Uuid().v1();
    title = "";
    vertex = Vertex.createEmpty();
    titleX = 0;
    titleY = 0;
    direction = 0;
  }
  void setCoordination(double x, double y, double direction){
    titleX = x;
    titleY = y;
    this.direction = direction;
  }

  @override
  int compareTo(Room other) {
    return title == other.title ? 1 : 0;
  }

  Room.fromJson(Map<String, dynamic> data) {
    uid = data["uid"];
    title = data['title'];
    titleX = data['titleX'];
    titleY = data['titleY'];
    direction = data['direction'];
    vertex = Vertex.fromJsonForConnection(data["vertex"]);
  }

  Room copy(){
    return Room.setAll(uid, title, titleX, titleY, direction);
  }

  Map<String, dynamic> toMap(){
    return {
      "uid" : uid,
      "title": title,
      "titleX": titleX,
      "titleY": titleY,
      "direction": direction,
      "vertex" : vertex.toMapForConnection(),
    };
  }
}