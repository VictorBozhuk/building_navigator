
import 'package:building_navigator/loader/dormitory_3/vertexes_path_dormitory_3.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../models/building_model.dart';
import 'dormitory_3/directions_dormitory_3.dart';
import 'dormitory_3/edges_dormitory_3.dart';
import 'dormitory_3/hotspots_dormitory_3.dart';
import 'dormitory_3/vertexes_dormitory_3.dart';
import 'hotspots/hotspots.dart';

List<Building> buildings = [
  Building("LNU Dormitory 3", 'assets/buildings/dormitory_3.jpg',
      vertexesDormitory_3,
      edgesDormitory_3,
      getHotspotsDormitory3,
      getDirectionDormitory3),
];




