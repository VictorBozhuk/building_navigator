import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/add_text_input.dart';

import '../styles/images.dart';
import '../algorithm_new/building_navigator.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';
import 'admin/list_rooms_admin_screen.dart';
import 'list_rooms_screen.dart';

class FindPathPage extends StatefulWidget{
  final Building building;
  FindPathPage({super.key, required this.building});

  @override
  State<StatefulWidget> createState() => FindPathPageState();
}

class FindPathPageState extends State<FindPathPage> {
  String sourceRoomTitle = '';

  TextEditingController txtSource = TextEditingController();
  TextEditingController txtDestination = TextEditingController();

  @override
  void initState() {
    txtSource.addListener(() {
      sourceRoomTitle = txtSource.text;
    });
    txtDestination.addListener(() {
      PathInfo.destinationRoom?.title = txtDestination.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    txtSource.dispose();
    txtDestination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Find room', context),
      body: MainContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddInput(inputController: txtSource, hint: "Current room", onSuffixTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListRoomsScreen()))),
            AddInput(inputController: txtDestination, hint: "Destination", onSuffixTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListRoomsScreen()))),
            MainPadding(child:
              MainButton(title: "Search", onPressed: () {
                setPath(widget.building);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        PanoramaScreen(
                            currentVertex: PathInfo.currentVertex!,
                            nextVertex: PathInfo.destinationRoom!.vertex)));
              },),
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

