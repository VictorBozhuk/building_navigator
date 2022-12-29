import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import '../../models/admin_info.dart';
import '../../models/area_model.dart';
import '../../models/vertex_connection_model.dart';
import '../../models/vertex_model.dart';
import '../actions/actions.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import 'add_vertex_screen.dart';
import 'add_vertexes_to_area_screen.dart';

class PanoramaVertexAdminScreen extends StatefulWidget{
  final String panoramaImagePath;
  late VertexConnection connection;
  final bool isCreate;
  PanoramaVertexAdminScreen({Key? key,
    required this.panoramaImagePath,
    required this.connection,
    required this.isCreate}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaVertexAdminScreenState();
}

class _PanoramaVertexAdminScreenState extends State<PanoramaVertexAdminScreen> {
  late List<Hotspot> hotspots = [];

  void _setStateAnalog(){
    setState(() {
      hotspots = [getHotspot(widget.connection)];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.connection.nextVertex.title ?? ""),
      body: Stack(
          children: [
            Panorama(
              onTap: (longitude, latitude, tilt) {
                widget.connection.iconX = roundDouble(longitude);
                widget.connection.iconY = roundDouble(latitude);
                _setStateAnalog();
              },
              onViewChanged: (longitude, latitude, tilt) {
                widget.connection.direction = roundDouble(longitude);
              },
              sensitivity: 2,
              hotspots: hotspots,
              child: Image.network(widget.panoramaImagePath),
            ),
            Column(children: [
              Padding(padding: const EdgeInsets.all(20), child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("${AdminInfo.selectedVertex?.title}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),),
                  const Text("<--->", style: TextStyle(color: Colors.white, fontSize: 20),),
                  Text("${AdminInfo.secondSelectedVertex?.title}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
              ),
              Row(children: [
                Text("Icon size: ${widget.connection.iconSize.toInt()}",
                  style: const TextStyle(color: Colors.red, fontSize: 22),),
                PositionChangerButton(title: "-", onPressed: () {
                  widget.connection.iconSize -= 10;
                  _setStateAnalog();
                },
                ),
                PositionChangerButton(title: "+", onPressed: () {
                  widget.connection.iconSize += 10;
                  _setStateAnalog();
                },
                ),
                ],
              ),
              ],
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            //Navigator.pop(context);
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddVertexConnectionScreen(isCreate: widget.isCreate)));

            if(AdminInfo.isCreateAreaConnection == false){
              AdminInfo.connection.nextVertex.areaConnection = AdminInfo.areaConnection;
              //AdminInfo.connection.nextVertex.isAreaConnection = true;
            }

            if(widget.isCreate == true){
              AdminInfo.connection.nextVertex = AdminInfo.secondSelectedVertex!;
              AdminInfo.selectedVertex?.vertexConnections ??= [];
              AdminInfo.selectedVertex?.vertexConnections?.add(AdminInfo.connection);
            }
            else{
              var editedVertex = AdminInfo.area.vertexes?.firstWhere((element) => element.uid == AdminInfo.selectedVertex?.uid);
              var editedConnection = editedVertex?.vertexConnections?.firstWhere((element) => element.uid == AdminInfo.connection.uid);
              editedConnection?.length = _getLength(AdminInfo.selectedVertex!, editedConnection.nextVertex, AdminInfo.area);
              editedConnection?.nextVertex = AdminInfo.secondSelectedVertex!;
              editedConnection?.direction = AdminInfo.connection.direction;
              editedConnection?.iconSize = AdminInfo.connection.iconSize;
              editedConnection?.iconX = AdminInfo.connection.iconX;
              editedConnection?.iconY = AdminInfo.connection.iconY;
            }

            if(AdminInfo.isCreateAreaConnection == false){
              AdminInfo.clearConnection();
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddVertexesToAreaScreen()));
            }
            else {
              AdminInfo.clearConnection();
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddVertexScreen()));
            }
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Hotspot getHotspot(VertexConnection connection)
{
  return Hotspot(
      height: connection.iconSize,
      width: connection.iconSize,
      longitude: connection.iconX,
      latitude: connection.iconY,
      orgin: Offset.fromDirection(0),
      widget: Image.asset('assets/icons/point.png'),
  );
}

double _getLength(Vertex first, Vertex second, Area area){
  return roundDouble(getLengthByPixels(first, second) / area.countOfPixelsInMeter);
}