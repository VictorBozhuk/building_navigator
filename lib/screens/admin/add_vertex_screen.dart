import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/swithes/main_switch.dart';
import '../widgets/text_inputs/main_text_input.dart';
import '../widgets/texts/main_text.dart';
import 'area_admin_screen.dart';
import 'areas_list_admin_screen.dart';
import 'rooms_list_admin_screen.dart';

class AddVertexScreen extends StatefulWidget{
  late bool isAreaConnection = AdminInfo.selectedVertex!.areaConnection != null;
  AddVertexScreen({super.key});
  @override
  State<StatefulWidget> createState() => _AddVertexScreenState();
}

class _AddVertexScreenState extends State<AddVertexScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();
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

    txtTitle.text = AdminInfo.selectedVertex!.title ?? "";
    txtTitle.addListener(() {
      AdminInfo.selectedVertex!.title = txtTitle.text;
    });

    txtImagePath.text = AdminInfo.selectedVertex!.panoramaImagePath ?? "";
    txtImagePath.addListener(() {
      AdminInfo.selectedVertex!.panoramaImagePath = txtImagePath.text;
    });
  }

  @override
  void dispose() {
    txtTitle.dispose();
    txtImagePath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Vertex editing', context),
        body: MainContainer(
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextInput(
                inputController: txtTitle,
                hint: "Title",
              ),
              MainTextInput(
                inputController: txtImagePath,
                hint: "Photo",
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
                MainPadding(
                  child: MainButton(
                      title: "Join area",
                      onPressed: onJoinArea
                  ),
                ),
              if(widget.isAreaConnection == true)
                MainPadding(
                  child: MainButton(
                      title: "Set coordinates",
                      onPressed: onSetCoordinates
                  ),
                ),
              MainPadding(
                child: MainButton(
                  title: "Rooms",
                  onPressed: onRooms
                ),
              ),
              MainPadding(
                child: MainButton(
                  title: "Save",
                  onPressed: onSave
                ),
              ),
            ],),
          ),
        ),
    );
  }
  
  void onJoinArea(){
    AdminInfo.isCreateAreaConnection = true;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            AreasListAdminScreen()
        ));
  }
  
  void onSetCoordinates(){
    if(AdminInfo.selectedVertex!.vertexConnections!.any((x) => x.nextVertex.uid == AdminInfo.selectedVertexOnOtherArea!.uid)){
      AdminInfo.connection = AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x)
      => x.nextVertex.uid == AdminInfo.selectedVertexOnOtherArea!.uid);
      AdminInfo.secondSelectedVertex = AdminInfo.selectedVertexOnOtherArea;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              PanoramaVertexAdminScreen(
                isCreate: false,
                panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '',
                connection: AdminInfo.connection,
              )
          ));
    }
    else{
      AdminInfo.clearConnection();
      AdminInfo.secondSelectedVertex = AdminInfo.selectedVertexOnOtherArea;
      //AdminInfo.secondSelectedVertex?.isAreaConnection = true;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              PanoramaVertexAdminScreen(
                isCreate: true,
                panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '',
                connection: AdminInfo.connection,
              )
          ));
    }

  }
  
  void onRooms(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
        const RoomsListAdminScreen()
        ));
  }
  
  void onSave(){
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
            AreaAdminScreen()
        ));
  }
}

