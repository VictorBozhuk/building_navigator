import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import 'add_room_screen.dart';
import 'add_vertex_connection.dart';

class PanoramaVertexAdminScreen extends StatefulWidget{
  final String panoramaImagePath;
  final Widget currentWidget;
  final bool isCreate;
  final int index;
  const PanoramaVertexAdminScreen({Key? key,
    required this.panoramaImagePath,
    required this.currentWidget,
    required this.isCreate,
    required this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaVertexAdminScreenState();
}

class _PanoramaVertexAdminScreenState extends State<PanoramaVertexAdminScreen> {
  late List<Hotspot> hotspots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: Panorama(
        onTap: (longitude, latitude, tilt) {
          AdminInfo.x = longitude;
          AdminInfo.y = latitude;
          setState(() {
            hotspots = [getHotspot(widget.currentWidget, AdminInfo.x, AdminInfo.y)];
          });
        },
        onViewChanged: (longitude, latitude, tilt) {
          AdminInfo.direction = longitude;
        },
        sensitivity: 2,
        hotspots: hotspots,
        child: Image.network(widget.panoramaImagePath),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            Navigator.pop(context);
            AdminInfo.setConnectionCoordinates();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                AddVertexConnectionScreen(isCreate: widget.isCreate)));
            }
          );
        },
        child: const Icon(Icons.add),
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