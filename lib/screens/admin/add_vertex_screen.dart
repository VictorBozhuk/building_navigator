import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';

import '../../Style/images.dart';
import '../../Style/text_styles/text_styles.dart';
import '../../models/admin_info.dart';
import '../widgets/building_widgets.dart';
import '../widgets/global/appBars.dart';
import '../widgets/swithes/main_switch.dart';
import '../widgets/swithes/new_switch.dart';
import '../widgets/text_inputs/main_text_input.dart';
import '../widgets/texts/main_text.dart';
import 'add_vertex_connection.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_areas_admin_screen.dart';
import 'list_rooms_admin_screen.dart';

class AddVertexScreen extends StatefulWidget{
  late bool isAreaConnection = AdminInfo.selectedVertex!.areaConnection != null;
  AddVertexScreen({super.key});
  @override
  State<StatefulWidget> createState() => _AddVertexScreenState();
}

class _AddVertexScreenState extends State<AddVertexScreen> {

  @override
  void initState(){
    super.initState();
    if(AdminInfo.selectedVertex!.areaConnection != null
        && AdminInfo.selectedVertexOnOtherArea == null
        && AdminInfo.selectedVertex!.vertexConnections!.any((x)
          => x.nextVertex.areaConnection != null)){
      AdminInfo.selectedVertexOnOtherArea =
          AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x)
            => x.nextVertex.areaConnection != null).nextVertex;
      AdminInfo.areaConnection = AdminInfo.selectedVertexOnOtherArea!.areaConnection!;
    }
  }

  TextEditingController txtTitle = TextEditingController(
      text: AdminInfo.selectedVertex?.title);
  TextEditingController txtImagePath = TextEditingController(
      text: AdminInfo.selectedVertex?.panoramaImagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.selectedVertex?.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.selectedVertex?.panoramaImagePath = text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Vertex editing'),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextInput(
                inputController: txtTitle,
                hint: "Title",
                label: AdminInfo.selectedVertex?.title ?? '',
                onChanged: _changeTitle,
              ),
              MainTextInput(
                inputController: txtImagePath,
                hint: "Photo",
                label: AdminInfo.selectedVertex?.panoramaImagePath ?? '',
                onChanged: _changeImagePath,
              ),
              MainSwitch(
                title: "Join area",
                value: widget.isAreaConnection,
                onChanged: (value) => setState(()
                => widget.isAreaConnection = value),
              ),
              if(widget.isAreaConnection == true)
                MainText(text: "Area: ${AdminInfo.areaConnection.title}"),
              if(widget.isAreaConnection == true)
                MainText(text: "Vertex: ${AdminInfo.selectedVertexOnOtherArea?.title}"),
              if(widget.isAreaConnection == true)
                MainButton(
                    title: "Join area",
                    onPressed: () {
                  AdminInfo.isCreateAreaConnection = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          const ListAreasAdminScreen()
                      ));
                }),
              if(widget.isAreaConnection == true)
                MainButton(
                    title: "Set coordinates",
                    onPressed: () {
                      if(AdminInfo.selectedVertex!.vertexConnections!.any((x) => x.nextVertex.uid == AdminInfo.selectedVertexOnOtherArea!.uid)){
                        AdminInfo.connection = AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x)
                        => x.nextVertex.uid == AdminInfo.selectedVertexOnOtherArea!.uid);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                AddVertexConnectionScreen(isCreate: false)
                            ));
                      }
                      else{
                        AdminInfo.clearConnection();
                        AdminInfo.secondSelectedVertex = AdminInfo.selectedVertexOnOtherArea;
                        //AdminInfo.secondSelectedVertex?.isAreaConnection = true;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                AddVertexConnectionScreen(isCreate: true)
                            ));
                      }

                    }),
              MainButton(
                  title: "Rooms",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            const ListRoomsAdminScreen()
                        ));
                  }),
              MainButton(
                  title: "Save",
                  onPressed: () {
                    var editedVertex = AdminInfo.area.vertexes?.firstWhere((x) => x.uid == AdminInfo.selectedVertex?.uid);
                    editedVertex?.title = AdminInfo.selectedVertex?.title;
                    editedVertex?.panoramaImagePath = AdminInfo.selectedVertex?.panoramaImagePath;
                    editedVertex?.rooms = AdminInfo.selectedVertex?.rooms;
                    if(AdminInfo.selectedVertex!.areaConnection != null)
                    {
                      //var connection = VertexConnection(nextVertex, direction, iconX, iconY, iconSize, iconPath, length)
                      //edited_vertex?.vertexConnections?.add(AdminInfo.selectedVertexOnOtherArea)
                    }
                    AdminInfo.clearAreaConnection();
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>
                            AddVertexesToAreaScreen()
                        ));
                  }),
            ],),)
        )
    );
  }
}

