import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_vertex_admin_screen.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:provider/provider.dart';

import '../../models/area_model.dart';
import '../../models/vertex_model.dart';
import '../../navigation/navi.dart';
import '../../providers/areas_provider.dart';
import '../../providers/vertexes_provider.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/swithes/main_switch.dart';
import '../widgets/text_inputs/main_text_input.dart';
import '../widgets/texts/main_text.dart';
import 'area_admin_screen.dart';
import 'areas_list_admin_screen.dart';
import 'rooms_list_admin_screen.dart';

class AddVertexScreen extends StatefulWidget{
  late Vertex vertex;
  late Area area;
  AddVertexScreen({super.key, required this.vertex, required this.area});
  @override
  State<StatefulWidget> createState() => _AddVertexScreenState();
}

class _AddVertexScreenState extends State<AddVertexScreen> {
  late VertexesProvider vertexProvider;
  late AreasProvider areaProvider;
  late bool isAreaConnection = widget.vertex.areaConnectionId != null;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();
  @override
  void initState(){
    super.initState();
    txtTitle.text = widget.vertex.title ?? "";
    txtTitle.addListener(() {
      widget.vertex.title = txtTitle.text;
    });

    txtImagePath.text = widget.vertex.panoramaImagePath ?? "";
    txtImagePath.addListener(() {
      widget.vertex.panoramaImagePath = txtImagePath.text;
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
    vertexProvider = Provider.of<VertexesProvider>(context);
    areaProvider = Provider.of<AreasProvider>(context, listen: false);

    if(widget.vertex.areaConnectionId != null){
      areaProvider.differentAreaVertexSelected = widget.vertex.vertexConnections
          .firstWhere((x) => x.nextVertex!.areaId != widget.area.id).nextVertex;
    }

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
                value: isAreaConnection,
                onChanged: (value) => setState(() => isAreaConnection = value),
              ),
              if(isAreaConnection == true)
                MainText(text: "Area: ${widget.vertex.areaConnection?.title}"),
              if(isAreaConnection == true)
                MainText(text: "Vertex: ${areaProvider.differentAreaVertexSelected?.title}"),
              if(isAreaConnection == true)
                MainPadding(
                  child: MainButton(
                      title: "Join area",
                      onPressed: onJoinArea
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
    if(widget.vertex.areaConnection != null){
      areaProvider.connection = widget.vertex.vertexConnections
          .firstWhere((vc) => vc.nextVertex!.areaId != widget.vertex.areaId);
    }
    Navi.push(context, AreasListAdminScreen(isSelectAreaConnection: true));
  }
  
  void onRooms(){
    Navi.push(context, RoomsListAdminScreen(vertex: areaProvider.firstSelected!));
  }
  
  Future<void> onSave() async {
    await vertexProvider.addOrUpdate(widget.vertex, widget.area);
    Navi.pop(context);
    //Navi.popAndPushReplacement(context, AreaAdminRoute(area: widget.area));
  }
}

