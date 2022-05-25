import 'package:building_navigator/screens/admin/list_rooms.dart';
import 'package:building_navigator/screens/panorama_screen.dart';
import 'package:building_navigator/screens/select_room.dart';
import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import 'list_vertex_connections.dart';
import 'list_vertexes.dart';

class AddVertexScreen extends StatefulWidget{

  AddVertexScreen({Key? key});

  @override
  State<StatefulWidget> createState() => AddVertexScreenState();
}

class AddVertexScreenState extends State<AddVertexScreen> {


  AddVertexScreenState({Key? key});

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.vertex.title);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.vertex.imagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.vertex.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.vertex.imagePath = text);
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
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Приміщення', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ListRoomsScreen(vertex: AdminInfo.vertex)
                          ));
                    },
                  )
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Сусідні вершини', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ListVertexConnectionsScreen(vertex: AdminInfo.vertex)
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
                      AdminInfo.building.vertexes.add(AdminInfo.vertex);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              ListVertexesScreen(building: AdminInfo.building)
                          ));
                    },
                  )
              ),
            ],),)

        )


    );
  }
}

