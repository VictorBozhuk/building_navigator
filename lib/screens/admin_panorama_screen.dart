import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../models/admin_info.dart';
import '../models/path_model.dart';
import 'admin/add_room.dart';
import 'admin/add_vertex_connection.dart';

class AdminParoramaScreen extends StatefulWidget{
  AdminParoramaScreen({Key? key, required this.panoramaImagePath, required this.isRoom, required this.widget, required this.isCreate, required this.index}) : super(key: key);
  final String panoramaImagePath;
  final Widget widget;
  final bool isRoom;
  final bool isCreate;
  final int index;

  @override
  State<StatefulWidget> createState() =>
      AdminParoramaScreenState(panoramaImagePath: panoramaImagePath, isRoom: isRoom,
          currentWidget: widget,  isCreate: isCreate, index: index);
}


class AdminParoramaScreenState extends State<AdminParoramaScreen> {
  AdminParoramaScreenState({required this.panoramaImagePath, required this.isRoom, required this.currentWidget, required this.isCreate, required this.index});
  final String panoramaImagePath;
  final Widget currentWidget;
  final bool isRoom;
  final bool isCreate;
  final int index;
  late List<Hotspot> hotspots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body:
      Panorama(
        onTap: (longitude, latitude, tilt) {
          AdminInfo.x = longitude;
          AdminInfo.y = latitude;
          setState(() {
            hotspots = [getHotspot(currentWidget, AdminInfo.x, AdminInfo.y)];
          });
        },
        onViewChanged: ( longitude,  latitude,  tilt) {
          AdminInfo.direction = longitude;
        },
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.network(panoramaImagePath),

      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            Navigator.pop(context);
            if(isRoom == true){
              AdminInfo.setRoomCoordinates();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  AddRoomScreen(vertex: AdminInfo.vertex, isCreate: isCreate, index: index,)));
            }
            else{
              AdminInfo.setConnectionCoordinates();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  AddVertexConnectionScreen(isCreate: isCreate)));
            }
          });
        },
      ),
    );
  }
}

Hotspot getHotspot(Widget widget, double x, double y)
{
  return Hotspot(
      height: AdminInfo.size,
      width: AdminInfo.size,
      longitude: x,
      latitude: y,
      orgin: Offset.fromDirection(0),
      widget: widget,
  );
}