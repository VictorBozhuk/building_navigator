import 'package:building_navigator/screens/panorama_screen.dart';
import 'package:building_navigator/screens/select_room.dart';
import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:flutter/material.dart';

import '../algorithm/building_navigator.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';

class FindPathPage extends StatefulWidget{
  final Building building;

  FindPathPage({Key? key, required this.building});

  @override
  State<StatefulWidget> createState() => FindPathPageState(building: building);
}

class FindPathPageState extends State<FindPathPage> {

  final Building building;

  FindPathPageState({Key? key, required this.building});

  TextEditingController txtSource = TextEditingController(text: PathInfo.sourceRoom);
  TextEditingController txtDestination = TextEditingController(text: PathInfo.destinationRoom);
  _changeSource(String text){
    setState(() => PathInfo.sourceRoom = text);
  }
  _changeDestinaton(String text){
    setState(() => PathInfo.destinationRoom = text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Find route'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: txtSource,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Source room",
                    suffixIcon: IconButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SelectRoomScreen(building: building, isSource: true, func: () =>
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => FindPathPage(building: building))),))),
                      icon: const Icon(Icons.add),
                      iconSize: 40,
                    )
                ),
                style: const TextStyle(fontSize: 22),

                onChanged: _changeSource),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(10),
            child: TextFormField(
                controller: txtDestination,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Destination room",
                    suffixIcon: IconButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SelectRoomScreen(building: building, isSource: false, func: () =>
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => FindPathPage(building: building)))))),
                      icon: const Icon(Icons.add),
                      iconSize: 40,
                    )
                ),
                style: const TextStyle(fontSize: 22),

                onChanged: _changeDestinaton),
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                child: const Text('Start route', style: TextStyle(
                  fontSize: 22,
                )),
                onPressed: () {
                  setPath(building);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  PanoramaScreen(
                  panoramaImagePath: PathInfo.currentVertex.imagePath,
                  nextVertexImagePath: PathInfo.nextVertexImagePath)));
                },
              )
          ),
      ],),
    );
  }
  String getPath(Building building)
  {
    BuildingNavigator client = BuildingNavigator(building.edges, building.vertexes);
    var ListPath = client.GetPath(PathInfo.sourceVertex, PathInfo.destinationVertex);
    String path = '';
    int length = ListPath?.length ?? 0;
    for(int i = 0; i < length; ++i)
    {
      path += ListPath![i];
    }

    return path;
  }

  void setPath(Building building){
    BuildingNavigator client = BuildingNavigator(building.edges, building.vertexes);
    var VertexesStr = client.GetPath(PathInfo.sourceVertex, PathInfo.destinationVertex);
    List<Vertex> vertexes = [];
    int vertexesStrLength = VertexesStr?.length ?? 0;
    for(int i = 0; i < vertexesStrLength; ++i)
    {
      for(int j = 0; j < building.vertexes.length; ++j)
      {
        if(VertexesStr?[i] == building.vertexes[j].Title)
        {
          vertexes.add(building.vertexes[j]);
          break;
        }
      }
    }

    PathInfo.setVertexes(vertexes);
  }

}

