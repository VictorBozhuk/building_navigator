import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:uuid/uuid.dart';

class Room extends Comparable<Room> {
  late String id;
  late String vertexId;
  late String title;
  late double titleX;
  late double titleY;
  late double direction;
  late double fontSize;
  late double titleBoxWidth;
  late double titleBoxHeight;
  late Color color;

  late Vertex vertex;

  Room(this.id, this.vertexId, this.title, this.titleX, this.titleY,
      this.direction, this.fontSize, this.titleBoxHeight, this.titleBoxWidth, this.color);
  Room.empty(this.vertexId){
    id = const Uuid().v1();
    title = "";
    titleX = 0;
    titleY = 0;
    direction = 0;
    fontSize = 18;
    titleBoxWidth = 100;
    titleBoxHeight = 100;
    color = Colors.red;
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
    id = data["id"];
    title = data['title'];
    titleX = data['titleX'];
    titleY = data['titleY'];
    direction = data['direction'];
    fontSize = data['fontSize'];
    titleBoxWidth = data['titleBoxWidth'];
    titleBoxHeight = data['titleBoxHeight'];
    color = Color(data["color"]);
  }

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "titleX": titleX,
      "titleY": titleY,
      "direction": direction,
      "fontSize": fontSize,
      "titleBoxWidth": titleBoxWidth,
      "titleBoxHeight": titleBoxHeight,
      "color": color.value,
    };
  }

  Room copy(){
    return Room(id, vertexId, title, titleX, titleY, direction, fontSize, titleBoxHeight, titleBoxWidth, color);
  }
}