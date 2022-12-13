import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../services/database.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import '../widgets/text_inputs/main_text_input.dart';
import 'list_areas_admin_screen.dart';
import 'list_buildings_admin_screen.dart';

class AddBuildingScreen extends StatefulWidget{

  const AddBuildingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddBuildingScreenState();
}

class _AddBuildingScreenState extends State<AddBuildingScreen> {
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
        appBar: getAppBar('Building editing'),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextInput(
                  inputController:txtTitle,
                  hint: "Title",
                  label: AdminInfo.building.title,
                  onChanged: _changeTitle
              ),
              MainTextInput(
                  inputController: txtImagePath,
                  hint: "Photo",
                  label: AdminInfo.building.imagePath,
                  onChanged: _changeImagePath
              ),
              MainButton(
                title: "Areas",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          ListAreasAdminScreen()
                      ));
                },
              ),
              MainButton(
                title: "Save",
                onPressed: () {
                  AdminInfo.checkBuildingId();
                  DatabaseService.addOrUpdateBuilding(AdminInfo.building);
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>
                          const ListBuildingsAdminScreen()
                      ));
                },
              ),
            ],
          ),
        ),
    );
  }
}

