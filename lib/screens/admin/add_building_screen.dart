import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:provider/provider.dart';

import '../../models/building_model.dart';
import '../../navigation/navi.dart';
import '../../models/admin_info.dart';
import '../../providers/buildings_provider.dart';
import '../../services/locator.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/text_inputs/main_text_input.dart';

class AddBuildingScreen extends StatefulWidget{
  late Building building;
  AddBuildingScreen({super.key, required this.building});

  @override
  State<StatefulWidget> createState() => _AddBuildingScreenState();
}

class _AddBuildingScreenState extends State<AddBuildingScreen> {
  late BuildingsProvider buildingProvider;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();

  @override
  void initState() {
    txtTitle.text = widget.building.title;
    txtTitle.addListener(() {
      widget.building.title = txtTitle.text;
    });
    txtImagePath.text = widget.building.imagePath;
    txtImagePath.addListener(() {
      widget.building.imagePath = txtImagePath.text;
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
    buildingProvider = Provider.of<BuildingsProvider>(context, listen: false);
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
                    title: "Save",
                    onPressed: () async {
                      await buildingProvider.addOrUpdate(widget.building);
                      Navi.pop(context);
                      //Navi.popAndPushReplacement(context, BuildingsListAdminRoute());
                    },
                  ),
              ),
            ],
          ),
        ),
    );
  }
}

