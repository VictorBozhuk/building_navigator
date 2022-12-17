import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/add_vertex_screen.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/main_text_input.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/global/appBars.dart';
import 'panorama_vertex_admin_screen.dart';
import 'add_vertexes_to_area_screen.dart';

class AddVertexConnectionScreen extends StatefulWidget{
  final bool isCreate;
  AddVertexConnectionScreen({super.key, required this.isCreate}){
    AdminInfo.connection.iconSize = AdminInfo.connection.iconSize == 0 ? 90 : AdminInfo.connection.iconSize;
    AdminInfo.connection.length = AdminInfo.connection.length == 0 ? 10 : AdminInfo.connection.length;
  }

  @override
  State<StatefulWidget> createState() => AddVertexConnectionScreenState();
}

class AddVertexConnectionScreenState extends State<AddVertexConnectionScreen> {
  TextEditingController txtLength = TextEditingController(text: AdminInfo.connection.length.toString());

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
              MainButton(
                  title: "Set coordinate",
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PanoramaVertexAdminScreen(
                        panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '',
                        connection: AdminInfo.connection,
                        isCreate: widget.isCreate)
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
