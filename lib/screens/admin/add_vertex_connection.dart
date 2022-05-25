import 'package:building_navigator/screens/admin/list_vertex_connections.dart';
import 'package:building_navigator/screens/panorama_screen.dart';
import 'package:building_navigator/screens/select_room.dart';
import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import '../admin_panorama_screen.dart';
import 'list_rooms.dart';
import 'list_vertexes.dart';

class AddVertexConnectionScreen extends StatefulWidget{

  AddVertexConnectionScreen({Key? key, required this.vertex, required this.isCreate, required this.index}){
    AdminInfo.size = AdminInfo.connection.iconSize;
  }

  final Vertex vertex;
  final bool isCreate;
  final int index;
  @override
  State<StatefulWidget> createState() => AddVertexConnectionScreenState(vertex: vertex,  isCreate: isCreate, index: index);
}

class AddVertexConnectionScreenState extends State<AddVertexConnectionScreen> {

  final Vertex vertex;
  final bool isCreate;
  final int index;
  AddVertexConnectionScreenState({Key? key, required this.vertex, required this.isCreate, required this.index});

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.connection.vertexTitle);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.connection.vertexImagePath);
  TextEditingController txtX = TextEditingController(text: AdminInfo.connection.iconX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.connection.iconY.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.connection.direction.toString());
  TextEditingController txtIconSize = TextEditingController(text: AdminInfo.connection.iconSize.toString());
  TextEditingController txtIconPath = TextEditingController(text: AdminInfo.connection.iconPath.toString());
  TextEditingController txtLength = TextEditingController(text: AdminInfo.connection.length.toString());


  _changeTitle(String text){
    setState(() => AdminInfo.connection.vertexTitle = text);
  }
  _changeX(String text){
    setState(() => AdminInfo.connection.iconX = double.parse(text));
  }
  _changeY(String text){
    setState(() => AdminInfo.connection.iconY = double.parse(text));
  }
  _changeDirection(String text){
    setState(() => AdminInfo.connection.direction = double.parse(text));
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.connection.vertexImagePath = text);
  }
  _changeIconSize(String text){
    setState(() => {
      AdminInfo.connection.iconSize = double.parse(text),
      AdminInfo.size = double.parse(text)});
  }
  _changeLength(String text){
    setState(() => AdminInfo.connection.length = double.parse(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Редагування вершини'),
        body: Container(
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
                    decoration: getTextFieldDecoration("Назва сусіда"),
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
                    child: const Text('Вказати на фото', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              AdminParoramaScreen(panoramaImagePath: vertex.imagePath ?? '', isRoom: false,
                                  widget: Image.asset('assets/icons/point.png'), isCreate: isCreate, index: index,)
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
                      if(isCreate == true){
                        AdminInfo.vertex.vertexConnections?.add(AdminInfo.connection);
                      }
                      else{
                        AdminInfo.vertex.vertexConnections![index] = AdminInfo.connection;
                      }
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                          ListVertexConnectionsScreen(vertex: AdminInfo.vertex)));
                    },
                  )
              ),
            ],),
          )
        )
    );
  }
}


