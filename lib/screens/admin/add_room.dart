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

class AddRoomScreen extends StatefulWidget{

  AddRoomScreen({Key? key, required this.vertex});

  final Vertex vertex;
  @override
  State<StatefulWidget> createState() => AddRoomScreenState(vertex: vertex);
}

class AddRoomScreenState extends State<AddRoomScreen> {

  final Vertex vertex;

  AddRoomScreenState({Key? key, required this.vertex});

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.room.title);
  TextEditingController txtX = TextEditingController(text: AdminInfo.room.titleX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.room.titleX.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.room.direction.toString());

  _changeTitle(String text){
    setState(() => {
      AdminInfo.size = text.length * 1.5,
      AdminInfo.room.title = text});
  }
  _changeX(String text){
    setState(() => AdminInfo.room.titleX = text as double);
  }
  _changeY(String text){
    setState(() => AdminInfo.room.titleY = text as double);
  }
  _changeDirection(String text){
    setState(() => AdminInfo.room.direction = text as double);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Редагування вершини'),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child:       Column(
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
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Визначити на фото', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          AdminParoramaScreen(panoramaImagePath: vertex.imagePath ?? '', isRoom: true,
                              widget: Text(AdminInfo.room.title,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Poppins',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700)))
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
                      AdminInfo.vertex.rooms?.add(AdminInfo.room);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                          ListRoomsScreen(vertex: AdminInfo.vertex)));
                    },
                  )
              ),
            ],),
        )
    );
  }
}


