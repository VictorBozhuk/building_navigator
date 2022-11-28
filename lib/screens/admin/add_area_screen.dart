import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/area_model.dart';
import '../widgets/building_widgets.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_areas_admin_screen.dart';
import 'list_rooms.dart';
import 'list_vertex_connections.dart';
import 'list_vertexes.dart';

class AddAreaScreen extends StatefulWidget{
  AddAreaScreen({Key? key, required this.isCreate, this.index});
  final bool isCreate;
  final int? index;
  @override
  State<StatefulWidget> createState() => AddAreaScreenState();
}

class AddAreaScreenState extends State<AddAreaScreen> {
  AddAreaScreenState({Key? key});

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.area.title);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.area.imagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.area.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.area.imagePath = text);
  }
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

        appBar: getAppBar('Редагування зони'),
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
                      child: const Text('Вершини', style: TextStyle(
                        fontSize: 22,
                      )),
                      onPressed: () {
                        AdminInfo.clearArea();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                AddVertexesToAreaScreen()
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
                          AdminInfo.building.areas.add(AdminInfo.area);
                        }
                        else{
                          AdminInfo.building.areas[widget.index!] = AdminInfo.area;
                        }
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>
                                ListAreasAdminScreen(AdminInfo.building)
                            ));
                      },
                    )
                ),
              ],),)

        )


    );
  }
}

