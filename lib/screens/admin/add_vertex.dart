import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../widgets/building_widgets.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_rooms.dart';
import 'list_vertex_connections.dart';
import 'list_vertexes.dart';

class AddVertexScreen extends StatefulWidget{

  AddVertexScreen({Key? key, required this.isCreate});
  final bool isCreate;
  @override
  State<StatefulWidget> createState() => AddVertexScreenState();
}

class AddVertexScreenState extends State<AddVertexScreen> {
  TextEditingController txtTitle = TextEditingController(text: AdminInfo.vertex.title);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.vertex.panoramaImagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.vertex.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.vertex.panoramaImagePath = text);
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
                      if(widget.isCreate == true){
                        AdminInfo.building.vertexes.add(AdminInfo.vertex);
                      }
                      else{
                        //AdminInfo.building.vertexes[widget.index] = AdminInfo.vertex;
                        var edited_vertex = AdminInfo.area.vertexes?.firstWhere((element) => element.uid == AdminInfo.vertex.uid);
                        edited_vertex?.title = AdminInfo.vertex.title;
                        edited_vertex?.panoramaImagePath = AdminInfo.vertex.panoramaImagePath;
                      }
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

