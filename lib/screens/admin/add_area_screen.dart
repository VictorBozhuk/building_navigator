import 'package:flutter/material.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/paddings/main_padding.dart';
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
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtScale = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();

  @override
  void initState() {
    txtTitle.text = AdminInfo.building.title;
    txtTitle.addListener(() {
      AdminInfo.building.title = txtTitle.text;
    });
    txtScale.text = AdminInfo.area.countOfPixelsInMeter.toString();
    txtScale.addListener(() {
      AdminInfo.area.countOfPixelsInMeter = int.parse(txtScale.text);
    });
    txtImagePath.text = AdminInfo.building.imagePath;
    txtImagePath.addListener(() {
      AdminInfo.building.imagePath = txtImagePath.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    txtTitle.dispose();
    txtScale.dispose();
    txtImagePath.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Editing area', context),
        body: MainContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainTextInput(
                    inputController: txtTitle,
                    hint: "Title",
                ),
                MainTextInput(
                    inputController: txtScale,
                    hint: "Count pixels in one meter",
                ),
                MainTextInput(
                    inputController: txtImagePath,
                    hint: "Photo",
                ),
                MainPadding(
                  child: MainButton(
                    title: 'Save',
                    onPressed: onSave
                  ),
                ),
              ],),
        )
    );
  }

  void onSave(){
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
}
