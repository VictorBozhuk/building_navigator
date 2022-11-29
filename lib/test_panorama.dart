import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';

double globalDirection = 0;
double globalLatitude = 0;
double globalTilt = 0;

class TestPanoramaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
          longitude: 20,
          sensitivity: 2,
          onViewChanged: ( longitude,  latitude,  tilt) {
            print(longitude);
          },
          child: Image.asset('assets/dormitory_3/7/704-706.jpg')
      ),
    );
  }
}