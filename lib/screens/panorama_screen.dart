import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/indicators/indicator.dart';
import 'package:panorama/panorama.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../models/vertex_model.dart';
import 'functions/functions.dart';

class PanoramaScreen extends StatefulWidget {
  PanoramaScreen({Key? key, required this.currentVertex, this.nextVertex}) : super(key: key);
  late Vertex currentVertex;
  late Vertex? nextVertex;

  @override
  State<PanoramaScreen> createState() => _PanoramaScreenState();
}

class _PanoramaScreenState extends State<PanoramaScreen> {
  List<Hotspot> hotspots = [];
  double direction = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.currentVertex.title!, context),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (_, AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData){
            return Panorama(
                longitude: UserInfo.getDirection(direction),
                sensitivity: 2,
                hotspots: hotspots,
                child: Image.network(widget.currentVertex.panoramaImagePath!)
            );
          } else{
            return const Indicator();
          }
        }
      ),
    );
  }

  Future<bool> getData() async {
    if(PathInfo.isWalk == true){
      hotspots = await getAllHotspots(context, widget.currentVertex);
    } else {
      hotspots = await getNextHotspots(context, widget.currentVertex, widget.nextVertex!);
      direction = getNextVertexDirection(widget.currentVertex, widget.nextVertex!);
    }

    return true;
  }
}