import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/select_room.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';

import '../Style/images.dart';
import '../algorithm_new/building_navigator.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';

class FindPathPage extends StatefulWidget{
  final Building building;
  String sourceRoomTitle = '';
  FindPathPage({Key? key, required this.building});

  @override
  State<StatefulWidget> createState() => FindPathPageState(building: building);
}

class FindPathPageState extends State<FindPathPage> {

  final Building building;

  FindPathPageState({Key? key, required this.building});

  TextEditingController txtSource = TextEditingController(text: '');
  TextEditingController txtDestination = TextEditingController(text: PathInfo.destinationRoom?.title);
  _changeSource(String text){
    setState(() => widget.sourceRoomTitle = text);
  }
  _changeDestinaton(String text){
    setState(() => PathInfo.destinationRoom?.title = text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Пошук приміщення'),
      body: Container(
        decoration: BoxDecoration(
          image: AppImages.backgroundImage,
        ),
        child:       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: txtSource,
                  decoration: InputDecoration(
                    hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                      hintText: "Поточне розташування",
                      suffixIcon: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SelectRoomScreen(building: building, isSource: true, func: () =>
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => FindPathPage(building: building))),))),
                        icon: const Icon(Icons.add, color: Colors.white,),
                        iconSize: 40,
                      )
                  ),
                  style: const TextStyle(fontSize: 22, color: Colors.white),

                  onChanged: _changeSource),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: txtDestination,
                  decoration: InputDecoration(
                      hoverColor: Colors.white,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                      hintText: "Призначення",
                      suffixIcon: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SelectRoomScreen(building: building, isSource: false, func: () =>
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => FindPathPage(building: building)))))),
                        icon: const Icon(Icons.add, color: Colors.white,),
                        iconSize: 40,
                      )
                  ),
                  style: const TextStyle(fontSize: 22, color: Colors.white),

                  onChanged: _changeDestinaton),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const Text('Почати шлях', style: TextStyle(
                    fontSize: 22,
                  )),
                  onPressed: () {
                    setPath(building);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            PanoramaScreen(
                                curentVertex: PathInfo.currentVertex!,
                                nextVertex: PathInfo.destinationRoom!.vertex)));
                  },
                )
            ),
          ],),
      )


    );
  }
  /*
  String getPathAsString(Building building)
  {
    BuildingNavigator client = BuildingNavigator(building.getEdges(), building.vertexes);
    var ListPath = client.GetPath(PathInfo.sourceVertexTitle, PathInfo.destinationVertexTitle);
    String path = '';
    int length = ListPath?.length ?? 0;
    for(int i = 0; i < length; ++i)
    {
      path += ListPath![i];
    }

    return path;
  }
*/

  void setPath(Building building){
    BuildingNavigator client = BuildingNavigator(building.getEdges(), building.vertexes);
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

