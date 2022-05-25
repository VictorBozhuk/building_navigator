import 'package:building_navigator/screens/admin/list_buildings_admin.dart';
import 'package:building_navigator/screens/panorama_screen.dart';
import 'package:building_navigator/screens/select_room.dart';
import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:building_navigator/services/database.dart';
import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import 'list_vertexes.dart';

class AddBuildingScreen extends StatefulWidget{

  AddBuildingScreen({Key? key});

  @override
  State<StatefulWidget> createState() => AddBuildingScreenState();
}

class AddBuildingScreenState extends State<AddBuildingScreen> {


  AddBuildingScreenState({Key? key});

  TextEditingController txtTitle = TextEditingController(text: AdminInfo.building.title);
  TextEditingController txtImagePath = TextEditingController(text: AdminInfo.building.imagePath);
  _changeTitle(String text){
    setState(() => AdminInfo.building.title = text);
  }
  _changeImagePath(String text){
    setState(() => AdminInfo.building.imagePath = text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Редагування будівлі'),
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
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                        hintText: "Назва",
                    ),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeTitle),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtImagePath,
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                        hintText: "Фото",
                    ),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              ListVertexesScreen(building: AdminInfo.building)
                          ));
                    },
                  )
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: const Text('Зберегти', style: TextStyle(
                      fontSize: 22,
                    )),
                    onPressed: () {
                      AdminInfo.checkBuildingId();
                      DatabaseService.addOrUpdateBuilding(AdminInfo.building);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              ListBuildingsAdminScreen()
                          ));
                    },
                  )
              ),
            ],),
        )


    );
  }
}

