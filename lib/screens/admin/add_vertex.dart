import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/vertex_connection_model.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../widgets/building_widgets.dart';
import 'add_vertex_connection.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_areas_admin_screen.dart';
import 'list_rooms.dart';
import 'list_vertex_connections.dart';
import 'list_vertexes.dart';

class AddVertexScreen extends StatefulWidget{

  AddVertexScreen({Key? key});
  @override
  State<StatefulWidget> createState() => AddVertexScreenState();
}

class AddVertexScreenState extends State<AddVertexScreen> {

  @override
  void initState(){
    super.initState();
    if(AdminInfo.selectedVertex!.isAreaConnection == true
        && AdminInfo.selectedVertexOnOtherArea == null
        && AdminInfo.selectedVertex!.vertexConnections!.any((x) => x.nextVertex.isAreaConnection)){
      AdminInfo.selectedVertexOnOtherArea = AdminInfo.selectedVertex!.vertexConnections!.firstWhere((x)
      => x.nextVertex.isAreaConnection).nextVertex;
      AdminInfo.areaConnection = AdminInfo.selectedVertexOnOtherArea!.area!;
    }
  }

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.selectedVertex?.title);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.selectedVertex?.panoramaImagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.selectedVertex?.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.selectedVertex?.panoramaImagePath = text);
  }
  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

        appBar: getAppBar('Редагування вершини'),
        body: Container(
          width: _screenWidth,
          height: _screenHeight,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtTitle,
                    decoration: getTextFieldDecoration("Назва"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                    onChanged: _changeTitle),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtImagePath,
                    decoration: getTextFieldDecoration("Фото"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeImagePath),
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 30),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Поєднювач зон",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white)),
                      Switch(
                        trackColor: MaterialStateProperty.all(Colors.black38),
                        activeColor: Colors.green.withOpacity(0.4),
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        value: AdminInfo.selectedVertex!.isAreaConnection,
                        onChanged: (value) => setState(() => AdminInfo.selectedVertex!.isAreaConnection = value),
                      ),
                    ],)
              ),
              if(AdminInfo.selectedVertex!.isAreaConnection == true)
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Зона: ${AdminInfo.areaConnection.title}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white)),
                      ],)
                ),
              if(AdminInfo.selectedVertex!.isAreaConnection == true)
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Вершина: ${AdminInfo.selectedVertexOnOtherArea?.title?? ""}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white)),
                      ],)
                ),
              if(AdminInfo.selectedVertex!.isAreaConnection == true)
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      child: const Text("З'єднати зону", style: TextStyle(
                        fontSize: 22,
                      )),
                      onPressed: () {
                        AdminInfo.isCreateAreaConnection = true;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                ListAreasAdminScreen()
                            ));
                      },
                    )
                ),
              if(AdminInfo.selectedVertex!.isAreaConnection == true)
                Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      child: const Text("Виставити координати", style: TextStyle(
                        fontSize: 22,
                      )),
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
                          AdminInfo.secondSelectedVertex?.isAreaConnection = true;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  AddVertexConnectionScreen(isCreate: true)
                              ));
                        }

                      },
                    )
                ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Приміщення', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ListRoomsScreen()
                          ));
                    },
                  )
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    child: const Text('Зберегти', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      var edited_vertex = AdminInfo.area.vertexes?.firstWhere((x) => x.uid == AdminInfo.selectedVertex?.uid);
                      edited_vertex?.title = AdminInfo.selectedVertex?.title;
                      edited_vertex?.panoramaImagePath = AdminInfo.selectedVertex?.panoramaImagePath;
                      edited_vertex?.rooms = AdminInfo.selectedVertex?.rooms;
                      if(AdminInfo.selectedVertex!.isAreaConnection == true)
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
                    },
                  )
              ),
            ],),)

        )


    );
  }
}

