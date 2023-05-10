import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/hotspots/hotspots.dart';
import 'package:lnu_navigator/screens/widgets/indicators/indicator.dart';
import 'package:panorama/panorama.dart';
import '../models/user_info.dart';
import '../models/vertex_model.dart';
import '../navigation/navi.dart';
import '../providers/areas_provider.dart';
import 'helper/direction.dart';

class PanoramaScreen extends StatefulWidget {
  PanoramaScreen({Key? key, required this.currentVertex, this.nextVertex}) : super(key: key);
  late Vertex currentVertex;
  late Vertex? nextVertex;

  @override
  State<PanoramaScreen> createState() => _PanoramaScreenState();
}

class _PanoramaScreenState extends State<PanoramaScreen> {
  late AreasProvider areaProvider;
  List<Hotspot> hotspots = [];
  double direction = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.currentVertex.title, context),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (_, AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData){
            return Panorama(
                longitude: getDirection(direction),
                sensitivity: 2,
                hotspots: hotspots,
                child: Image.network(widget.currentVertex.panoramaImagePath)
            );
          } else{
            return const Indicator();
          }
        }
      ),
    );
  }

  Future<bool> getData() async {
    if(areaProvider.isShowPath){
      hotspots = await _getAllHotspots(context, widget.currentVertex);
    } else {
      hotspots = await _getNextHotspots(context, widget.currentVertex, widget.nextVertex!);
      direction = _getNextVertexDirection(widget.currentVertex, widget.nextVertex!);
    }

    return true;
  }



  Future<List<Hotspot>> _getAllHotspots(BuildContext context, Vertex current) async
  {
    List<Hotspot> hotspots = getRoomHotspots(current);

    for(var vc in current.vertexConnections) {
      var nextVertex = areaProvider.allVertexes.firstWhere((x) => x.id == vc.nextVertex!.id);
      hotspots.add(getHotspotPoint(
          x: vc.iconX,
          y: vc.iconY,
          size: vc.iconSize,
          context: context,
          current: nextVertex,
          iconAngle: vc.iconAngle,
          onPressed: () {
            areaProvider.move();
            Navi.pushReplacement(context, PanoramaScreen(currentVertex: nextVertex));
          }
      ));
    }

    return hotspots;
  }

  Future<List<Hotspot>> _getNextHotspots(BuildContext context, Vertex current, Vertex next) async
  {
    List<Hotspot> hotspots = getRoomHotspots(current);

    for(var vc in current.vertexConnections){
      if(vc.nextVertex!.id == next.id){
        var nextVertex = areaProvider.allVertexes.firstWhere((x) => x.id == next.id);
        hotspots.add(getHotspotPoint(
            x: vc.iconX,
            y: vc.iconY,
            size: vc.iconSize,
            context: context,
            current: nextVertex,
            onPressed: () {
              areaProvider.move();
              Navi.pushReplacement(context, PanoramaScreen(currentVertex: nextVertex, nextVertex: areaProvider.next));
            },
            iconAngle: vc.iconAngle
        ));
      }
    }

    return hotspots;
  }

  List<Hotspot> getRoomHotspots(Vertex vertex){
    List<Hotspot> hotspots = [];
    for(var r in vertex.rooms){
      hotspots.add(getRoomHotspot(r));
    }

    return hotspots;
  }

  double _getNextVertexDirection(Vertex current, Vertex next)
  {
    for(var vc in current.vertexConnections){
      if(vc.nextVertex!.id == next.id){
        return vc.direction;
      }
    }
    return 0;
  }
}