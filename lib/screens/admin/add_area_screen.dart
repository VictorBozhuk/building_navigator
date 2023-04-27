import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';

import '../../navigation/navi.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/paddings/main_padding.dart';
import '../widgets/text_inputs/main_text_input.dart';

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
    txtTitle.text = AdminInfo.area.title;
    txtTitle.addListener(() {
      AdminInfo.area.title = txtTitle.text;
    });
    txtScale.text = AdminInfo.area.pixelsInMeter.toString();
    txtScale.addListener(() {
      AdminInfo.area.pixelsInMeter = int.parse(txtScale.text);
    });
    txtImagePath.text = AdminInfo.area.imagePath;
    txtImagePath.addListener(() {
      AdminInfo.area.imagePath = txtImagePath.text;
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
      Navi.push(context, AreasListAdminRoute());
    }
    else {
      var area = AdminInfo.building.areas.firstWhere((x) => x.id == AdminInfo.area.id);
      area.title = AdminInfo.area.title;
      area.imagePath = AdminInfo.area.imagePath;
      Navi.push(context, AreaAdminRoute());
    }
  }
}
