import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import 'admin_panorama_screen.dart';
import '../widgets/building_widgets.dart';
import 'list_rooms.dart';
import 'list_vertexes.dart';

class AddRoomScreen extends StatefulWidget{
  AddRoomScreen({Key? key, required this.isCreate}){
    AdminInfo.setSize(AdminInfo.room.title);
  }
  final bool isCreate;
  @override
  State<StatefulWidget> createState() => AddRoomScreenState();
}

class AddRoomScreenState extends State<AddRoomScreen> {
  TextEditingController txtTitle = TextEditingController(text: AdminInfo.room.title);
  TextEditingController txtX = TextEditingController(text: AdminInfo.room.titleX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.room.titleY.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.room.direction.toString());

  _changeTitle(String text){
    setState(() => {
      AdminInfo.setSize(text),
      AdminInfo.room.title = text});
  }
  _changeX(String text){
    setState(() => AdminInfo.room.titleX = double.parse(text));
  }
  _changeY(String text){
    setState(() => AdminInfo.room.titleY = double.parse(text));
  }
  _changeDirection(String text){
    setState(() => AdminInfo.room.direction = double.parse(text));
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: getAppBar('Приміщення'),
        body: Container(
          height: _screenHeight,
          width: _screenWidth,
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
                    child: const Text('Відзначити координати', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          AdminParoramaScreen(panoramaImagePath: AdminInfo.selectedVertex!.panoramaImagePath ?? '', isRoom: true,
                              currentWidget: Text(AdminInfo.room.title,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Poppins',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700)), isCreate: widget.isCreate, index: 0,)
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
                        AdminInfo.selectedVertex!.rooms ??= [];
                        AdminInfo.selectedVertex!.rooms?.add(AdminInfo.room);
                      }
                      else{
                        var room = AdminInfo.selectedVertex!.rooms!.firstWhere((x) => x.uid == AdminInfo.room.uid);
                        room.title = AdminInfo.room.title;
                        room.titleX = AdminInfo.room.titleX;
                        room.titleY = AdminInfo.room.titleY;
                        room.direction = AdminInfo.room.direction;
                      }
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                          ListRoomsScreen()));
                    },
                  )
              ),
            ],),)
        )
    );
  }
}


