import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/path_model.dart';
import 'add_room.dart';
import 'add_vertex_connection.dart';

class AdminParoramaScreen extends StatefulWidget{
  AdminParoramaScreen({Key? key, required this.panoramaImagePath, required this.isRoom, required this.currentWidget, required this.isCreate, required this.index}) : super(key: key);
  final String panoramaImagePath;
  final Widget currentWidget;
  final bool isRoom;
  final bool isCreate;
  final int index;

  @override
  State<StatefulWidget> createState() => AdminParoramaScreenState();
}


class AdminParoramaScreenState extends State<AdminParoramaScreen> {
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
            hotspots = [getHotspot(widget.currentWidget, AdminInfo.x, AdminInfo.y)];
          });
        },
        onViewChanged: ( longitude,  latitude,  tilt) {
          AdminInfo.direction = longitude;
        },
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.network(widget.panoramaImagePath),

      ),
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            Navigator.pop(context);
            if(widget.isRoom == true){
              AdminInfo.setRoomCoordinates();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  AddRoomScreen(isCreate: widget.isCreate)));
            }
            else{
              AdminInfo.setConnectionCoordinates();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  AddVertexConnectionScreen(isCreate: widget.isCreate)));
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