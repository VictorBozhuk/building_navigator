import 'package:lnu_navigator/models/vertex_model.dart';
import 'package:panorama/panorama.dart';
import '../screens/widgets/hotspots/hotspots.dart';
import 'area_model.dart';
import 'edge_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Building {
  late String id;
  late String title;
  late String imagePath;

  late List<Area> areas;

  Building(this.title, this.imagePath){
    id = const Uuid().v1();
    areas = [];
  }

  Building.empty(){
    id = const Uuid().v1();
    title = '';
    imagePath = '';
    areas = [];
  }

  Building.copy(this.id, this.title, this.imagePath);

  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "title": title,
      "imagePath": imagePath,
    };
  }

  Building.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    imagePath = data['imagePath'];
  }

  Building copy(){
    return Building.copy(id, title, imagePath);
  }
}