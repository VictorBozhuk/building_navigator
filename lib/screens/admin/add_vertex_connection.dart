import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import '../admin_panorama_screen.dart';
import '../widgets/building_widgets.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_rooms.dart';
import 'list_vertex_connections.dart';
import 'list_vertexes.dart';

class AddVertexConnectionScreen extends StatefulWidget{

  AddVertexConnectionScreen({Key? key, required this.isCreate}){
    AdminInfo.size = AdminInfo.connection.iconSize;
  }

  final bool isCreate;
  @override
  State<StatefulWidget> createState() => AddVertexConnectionScreenState();
}

class AddVertexConnectionScreenState extends State<AddVertexConnectionScreen> {
  TextEditingController txtX = TextEditingController(text: AdminInfo.connection.iconX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.connection.iconY.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.connection.direction.toString());
  TextEditingController txtIconSize = TextEditingController(text: AdminInfo.connection.iconSize.toString());
  TextEditingController txtIconPath = TextEditingController(text: AdminInfo.connection.iconPath.toString());
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
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: getAppBar('Вершина сусід'),
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
                child: Text("${AdminInfo.selectedVertex?.title} -- ${AdminInfo.secondSelectedVertex?.title}")
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtLength,
                    decoration: getTextFieldDecoration("Відстань"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeLength),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtX,
                    decoration: getTextFieldDecoration("х"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeX),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtY,
                    decoration: getTextFieldDecoration("у"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeY),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtDirection,
                    decoration: getTextFieldDecoration("Напрямок"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeDirection),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtIconSize,
                    decoration: getTextFieldDecoration("Розмір іконки"),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeIconSize),
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Відзначити координати', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              AdminParoramaScreen(panoramaImagePath: AdminInfo.selectedVertex?.panoramaImagePath ?? '', isRoom: false,
                                  widget: Image.asset('assets/icons/point.png'), isCreate: widget.isCreate, index: 0,)
                          ));
                    },
                  )
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: ElevatedButton(
                    child: const Text('Зберегти', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      if(widget.isCreate == true){
                        AdminInfo.connection.nextVertex = AdminInfo.secondSelectedVertex!;
                        AdminInfo.selectedVertex?.vertexConnections ??= [];
                        AdminInfo.selectedVertex?.vertexConnections?.add(AdminInfo.connection);
                      }
                      else{
                        var edited_vertex = AdminInfo.area.vertexes?.firstWhere((element) => element.uid == AdminInfo.selectedVertex?.uid);
                        var edited_connection = edited_vertex?.vertexConnections?.firstWhere((element) => element.uid == AdminInfo.connection.uid);
                        edited_connection?.length = AdminInfo.connection.length;
                        edited_connection?.nextVertex = AdminInfo.secondSelectedVertex!;
                        edited_connection?.direction = AdminInfo.connection.direction;
                        edited_connection?.iconSize = AdminInfo.connection.iconSize;
                        edited_connection?.iconX = AdminInfo.connection.iconX;
                        edited_connection?.iconY = AdminInfo.connection.iconY;

                      }
                      AdminInfo.clearConnection();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                          AddVertexesToAreaScreen()));
                    },
                  )
              ),
            ],),
          )
        )
    );
  }
}


