import 'package:flutter/material.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import '../widgets/text_inputs/main_text_input.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_areas_admin_screen.dart';

class AddAreaScreen extends StatefulWidget{
  const AddAreaScreen({super.key, required this.isCreate});
  final bool isCreate;
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
    return Scaffold(
        appBar: getAppBar('Editing area'),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: AppImages.backgroundImage,
            ),
            child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainTextInput(
                    inputController: txtTitle,
                    hint: "Title",
                    label: AdminInfo.area.title,
                    onChanged: _changeTitle
                ),
                MainTextInput(
                    inputController: txtImagePath,
                    hint: "Photo",
                    label: AdminInfo.area.imagePath,
                    onChanged: _changeImagePath
                ),
                MainButton(
                  title: 'Save',
                  onPressed: () {
                    if(widget.isCreate == true){
                      AdminInfo.building.areas.add(AdminInfo.area);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              ListAreasAdminScreen()
                          ));
                    }
                    else {
                      var area = AdminInfo.building.areas.firstWhere((x) => x.uid == AdminInfo.area.uid);
                      area.title = AdminInfo.area.title;
                      area.imagePath = AdminInfo.area.imagePath;
                      Navigator.pop(context);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>
                              AddVertexesToAreaScreen()
                          ));
                    }
                  }
                ),
              ],),)
        )
    );
  }
}
