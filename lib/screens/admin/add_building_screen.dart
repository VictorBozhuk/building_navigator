import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';

import '../../navigation/navi.dart';
import '../../models/admin_info.dart';
import '../../services/database.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/text_inputs/main_text_input.dart';

class AddBuildingScreen extends StatefulWidget{

  const AddBuildingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddBuildingScreenState();
}

class _AddBuildingScreenState extends State<AddBuildingScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();

  @override
  void initState() {
    txtTitle.text = AdminInfo.building.title;
    txtTitle.addListener(() {
      AdminInfo.building.title = txtTitle.text;
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
    txtImagePath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Building editing', context),
        body: MainContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextInput(
                  inputController: txtTitle,
                  hint: "Title",
              ),
              MainTextInput(
                  inputController: txtImagePath,
                  hint: "Photo",
              ),
              MainPadding(
                child: MainButton(
                  title: "Areas",
                  onPressed: () {
                    Navi.push(context, AreasListAdminRoute());
                  },
                ),
              ),
              MainPadding(
                child: MainButton(
                    title: "Save",
                    onPressed: () {
                      //
                      DatabaseService.addOrUpdateBuilding(AdminInfo.building);
                      //
                      Navi.popAndPushReplacement(context, BuildingsListAdminRoute());
                    },
                  ),
              ),
            ],
          ),
        ),
    );
  }
}

