import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';

import '../styles/images.dart';
import '../algorithm_new/building_navigator.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';
import 'admin/list_rooms_admin_screen.dart';
import 'list_rooms_screen.dart';

class FindPathPage extends StatefulWidget{
  final Building building;
  String sourceRoomTitle = '';
  FindPathPage({super.key, required this.building});

  @override
  State<StatefulWidget> createState() => FindPathPageState();
}

class FindPathPageState extends State<FindPathPage> {
  FindPathPageState({Key? key});

  TextEditingController txtSource = TextEditingController();
  TextEditingController txtDestination = TextEditingController();
  _changeSource(String text){
    setState(() => widget.sourceRoomTitle = text);
  }
  _changeDestination(String text){
    setState(() => PathInfo.destinationRoom?.title = text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Find room'),
      body: Container(
        decoration: BoxDecoration(
          image: AppImages.backgroundImage,
        ),
        child:       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: txtSource,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                      hintText: "Current room",
                      suffixIcon: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ListRoomsScreen())),
                        icon: const Icon(Icons.add, color: Colors.white,),
                        iconSize: 40,
                      )
                  ),
                  style: const TextStyle(fontSize: 22, color: Colors.white),

                  onChanged: _changeSource),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: txtDestination,
                  decoration: InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                      hintText: "Destination",
                      suffixIcon: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ListRoomsScreen())),
                        icon: const Icon(Icons.add, color: Colors.white,),
                        iconSize: 40,
                      )
                  ),
                  style: const TextStyle(fontSize: 22, color: Colors.white),

                  onChanged: _changeDestination),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Search', style: TextStyle(
                    fontSize: 22,
                  )),
                  onPressed: () {
                    setPath(widget.building);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            PanoramaScreen(
                                currentVertex: PathInfo.currentVertex!,
                                nextVertex: PathInfo.destinationRoom!.vertex)));
                  },
                )
              ),
          ],),
      )


    );
  }

  void setPath(Building building){
    PathFinder client = PathFinder(building.getEdges(), building.vertexes);
    var VertexIds = client.GetPath(PathInfo.sourceVertex!.uid, PathInfo.destinationRoom!.vertex.uid);
    List<Vertex> vertexes = [];
    var allVertexes = building.getAllVertexes();
    for(int i = 0; i < VertexIds!.length; ++i)
    {
      for(int j = 0; j < allVertexes.length; ++j)
      {
        if(VertexIds[i] == allVertexes[j].uid)
        {
          vertexes.add(allVertexes[j]);
          break;
        }
      }
    }
    PathInfo.setVertexes(vertexes);
  }
}

