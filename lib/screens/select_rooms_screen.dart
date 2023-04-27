import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/add_text_input.dart';

import '../navigation/navi.dart';
import '../styles/images.dart';
import '../algorithm_new/building_navigator.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/vertex_model.dart';
import 'admin/rooms_list_admin_screen.dart';
import 'functions/functions.dart';
import 'rooms_list_screen.dart';

class SelectRoomsScreen extends StatefulWidget{
  final Building building;
  SelectRoomsScreen({super.key, required this.building});

  @override
  State<StatefulWidget> createState() => _SelectRoomsScreenState();
}

class _SelectRoomsScreenState extends State<SelectRoomsScreen> {
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
                  MaterialPageRoute(builder: (context) => RoomsListScreen()))),
            AddInput(inputController: txtDestination, hint: "Destination", onSuffixTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoomsListScreen()))),
            MainPadding(child:
              MainButton(title: "Search", onPressed: () async {
                await setPath(widget.building);
                Navi.push(context, PanoramaRoute(
                    currentVertex: PathInfo.currentVertex!,
                    nextVertex: PathInfo.destinationRoom!.vertex));
              },),
            ),
          ],),
      )
    );
  }

  Future<void> setPath(Building building) async {
    PathFinder client = PathFinder(await getEdges(building), await getAllVertexes(building));
    var vertexIds = client.GetPath(PathInfo.sourceVertex!.id, PathInfo.destinationRoom!.vertex.id);
    List<Vertex> vertexes = [];
    var allVertexes = await getAllVertexes(building);
    for(int i = 0; i < vertexIds!.length; ++i)
    {
      for(int j = 0; j < allVertexes.length; ++j)
      {
        if(vertexIds[i] == allVertexes[j].id)
        {
          vertexes.add(allVertexes[j]);
          break;
        }
      }
    }
    PathInfo.setVertexes(vertexes);
  }
}

