import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import '../../models/admin_info.dart';
import '../../models/area_model.dart';
import '../../models/vertex_connection_model.dart';
import '../../models/vertex_model.dart';
import '../../navigation/navi.dart';
import '../../providers/vertexes_provider.dart';
import '../actions/actions.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/circle_button.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/paddings/main_padding.dart';
import 'add_vertex_screen.dart';
import 'area_admin_screen.dart';

class PanoramaVertexAdminScreen extends StatefulWidget{
  late Vertex first;
  late VertexConnection connection;
  final Vertex second;
  final Area area;
  PanoramaVertexAdminScreen({Key? key,
    required this.first,
    required this.connection,
    required this.second,
    required this.area
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PanoramaVertexAdminScreenState();
}

class _PanoramaVertexAdminScreenState extends State<PanoramaVertexAdminScreen> {
  late VertexesProvider vertexProvider;
  late List<Hotspot> hotspots = [];

  void _setStateAnalog(){
    hotspots = [getHotspot()];
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    vertexProvider = Provider.of<VertexesProvider>(context);
    return Scaffold(
      appBar: getAppBar("Tap on ${widget.second.title}", context),
      body: Stack(
        children: [
          Panorama(
            onTap: (longitude, latitude, tilt) {
              widget.connection.iconX = roundDouble(longitude) + (widget.connection.iconSize / 15);
              widget.connection.iconY = roundDouble(latitude) + (widget.connection.iconSize / 15);
              _setStateAnalog();
            },
            onViewChanged: (longitude, latitude, tilt) {
              widget.connection.direction = roundDouble(longitude);
            },
            sensitivity: 2,
            hotspots: hotspots,
            child: Image.network(widget.first.panoramaImagePath),
          ),
          MainPadding(
            child: Column(children: [
              Row(children: [
                Text("Icon size: ${widget.connection.iconSize.toInt()}",
                  style: const TextStyle(color: Colors.red, fontSize: 22),),
                CircleButton(text: "-", onPressed: () {
                  widget.connection.iconSize -= 10;
                  _setStateAnalog();
                },
                ),
                CircleButton(text: "+", onPressed: () {
                  widget.connection.iconSize += 10;
                  _setStateAnalog();
                },
                ),
                ],
              ),
              Row(children: [
                Text("Icon angle: ${widget.connection.iconAngle.toInt()}",
                  style: const TextStyle(color: Colors.red, fontSize: 22),),
                CircleButton(text: "-", onPressed: () {
                  if(widget.connection.iconAngle > -10) {
                    widget.connection.iconAngle -= 1;
                    _setStateAnalog();
                  }
                },
                ),
                CircleButton(text: "+", onPressed: () {
                  if(widget.connection.iconAngle < 10){
                    widget.connection.iconAngle += 1;
                    _setStateAnalog();
                  }
                },
                ),
              ],),
            ],),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: onSave,
        child: const Icon(Icons.check),
      ),
    );
  }


  Future<void> onSave() async {
    if(widget.first.vertexConnections.any((vc) => vc.id == widget.connection.id) == false){
      widget.first.vertexConnections.add(widget.connection);
    }
    await vertexProvider.addOrUpdate(widget.first, widget.area);
    Navi.pop(context);
  }

  Hotspot getHotspot()
  {
    return Hotspot(
      height: widget.connection.iconSize,
      width: widget.connection.iconSize,
      longitude: widget.connection.iconX,
      latitude: widget.connection.iconY,
      orgin: Offset.fromDirection(0),
      widget: Image.asset('assets/icons/point_${widget.connection.iconAngle}.png'),
    );
  }

  double _getLength(Vertex first, Vertex second, Area area){
    try{
      return roundDouble(getLengthByPixels(first, second, AdminInfo.pictureSize) / area.pixelsInMeter);
    }
    catch(ex){
      print(ex.toString());
      return 1;
    }
  }
}

