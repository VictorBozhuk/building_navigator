import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/add_vertex_screen.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/main_text_input.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../widgets/global/appBars.dart';
import 'panorama_admin_screen.dart';
import 'add_vertexes_to_area_screen.dart';

class AddVertexConnectionScreen extends StatefulWidget{
  final bool isCreate;
  AddVertexConnectionScreen({super.key, required this.isCreate}){
    AdminInfo.connection.iconSize = AdminInfo.connection.iconSize == 0 ? 90 : AdminInfo.connection.iconSize;
    AdminInfo.connection.length = AdminInfo.connection.length == 0 ? 10 : AdminInfo.connection.length;
    AdminInfo.size = AdminInfo.connection.iconSize;
  }

  @override
  State<StatefulWidget> createState() => AddVertexConnectionScreenState();
}

class AddVertexConnectionScreenState extends State<AddVertexConnectionScreen> {
  TextEditingController txtX = TextEditingController(text: AdminInfo.connection.iconX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.connection.iconY.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.connection.direction.toString());
  TextEditingController txtIconPath = TextEditingController(text: AdminInfo.connection.iconPath.toString());
  TextEditingController txtIconSize = TextEditingController(text: AdminInfo.connection.iconSize.toString());
  TextEditingController txtLength = TextEditingController(text: AdminInfo.connection.length.toString());

  _changeX(String text){
    setState(() => {
      if(double.tryParse(text) != null){
        AdminInfo.connection.iconX = double.parse(text)
      }
    });
  }
  _changeY(String text){
    setState(() => {
      if(double.tryParse(text) != null){
        AdminInfo.connection.iconY = double.parse(text)
      }
    });
  }
  _changeDirection(String text){
    setState(() => {
      if(double.tryParse(text) != null){
        AdminInfo.connection.direction = double.parse(text)
      }
    });
  }

  _changeIconSize(String text){
    setState(() => {
      if(double.tryParse(text) != null){
        AdminInfo.connection.iconSize = double.parse(text),
        AdminInfo.size = double.parse(text),
      }
    });
  }
  _changeLength(String text){
    setState(() => {
      if(double.tryParse(text) != null){
        AdminInfo.connection.length = double.parse(text)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Neighbor vertex'),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(20), child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("${AdminInfo.selectedVertex?.title}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),),
                  const Text("<--->", style: TextStyle(color: Colors.white, fontSize: 20),),
                  Text("${AdminInfo.secondSelectedVertex?.title}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),)
                ],),
              ),
              MainTextInput(
                  inputController: txtLength,
                  hint: "Length",
                  label: AdminInfo.connection.length.toString(),
                  onChanged: _changeLength
              ),
              MainTextInput(
                  inputController: txtX,
                  hint: "x",
                  label: AdminInfo.connection.iconX.toString(),
                  onChanged: _changeX
              ),
              MainTextInput(
                  inputController: txtY,
                  hint: "y",
                  label: AdminInfo.connection.iconY.toString(),
                  onChanged: _changeY
              ),
              MainTextInput(
                  inputController: txtDirection,
                  hint: "Direction",
                  label: AdminInfo.connection.direction.toString(),
                  onChanged: _changeDirection
              ),
              MainTextInput(
                  inputController: txtIconSize,
                  hint: "Icon size",
                  label: AdminInfo.connection.iconSize.toString(),
                  onChanged: _changeIconSize
              ),
              MainButton(
                  title: "Set coordinate",
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PanoramaAdminScreen(panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '', isRoom: false,
                        currentWidget: Image.asset('assets/icons/point.png'), isCreate: widget.isCreate, index: 0,)
                    ));
              }),
              MainButton(
                  title: "Save",
                  onPressed: () {

                    if(AdminInfo.isCreateAreaConnection == false){
                      AdminInfo.connection.nextVertex.areaConnection = AdminInfo.areaConnection;
                      //AdminInfo.connection.nextVertex.isAreaConnection = true;
                    }

                    if(widget.isCreate == true){
                      AdminInfo.connection.nextVertex = AdminInfo.secondSelectedVertex!;
                      AdminInfo.selectedVertex?.vertexConnections ??= [];
                      AdminInfo.selectedVertex?.vertexConnections?.add(AdminInfo.connection);
                    }
                    else{
                      var editedVertex = AdminInfo.area.vertexes?.firstWhere((element) => element.uid == AdminInfo.selectedVertex?.uid);
                      var editedConnection = editedVertex?.vertexConnections?.firstWhere((element) => element.uid == AdminInfo.connection.uid);
                      editedConnection?.length = AdminInfo.connection.length;
                      editedConnection?.nextVertex = AdminInfo.secondSelectedVertex!;
                      editedConnection?.direction = AdminInfo.connection.direction;
                      editedConnection?.iconSize = AdminInfo.connection.iconSize;
                      editedConnection?.iconX = AdminInfo.connection.iconX;
                      editedConnection?.iconY = AdminInfo.connection.iconY;
                    }

                    if(AdminInfo.isCreateAreaConnection == false){
                      AdminInfo.clearConnection();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AddVertexesToAreaScreen()));
                    }
                    else {
                      AdminInfo.clearConnection();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => AddVertexScreen()));
                    }
                  },
              ),
            ],),
          )
        )
    );
  }
}
