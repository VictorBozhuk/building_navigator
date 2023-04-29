import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:provider/provider.dart';

import '../../models/area_model.dart';
import '../../navigation/navi.dart';
import '../../models/admin_info.dart';
import '../../providers/areas_provider.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/paddings/main_padding.dart';
import '../widgets/text_inputs/main_text_input.dart';

class AddAreaScreen extends StatefulWidget{
  late Area area;
  AddAreaScreen({super.key, required this.area});
  @override
  State<StatefulWidget> createState() => AddAreaScreenState();
}

class AddAreaScreenState extends State<AddAreaScreen> {
  late AreasProvider areaProvider;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtScale = TextEditingController();
  TextEditingController txtImagePath = TextEditingController();

  @override
  void initState() {
    txtTitle.text = widget.area.title;
    txtTitle.addListener(() {
      widget.area.title = txtTitle.text;
    });
    txtScale.text = widget.area.pixelsInMeter.toString();
    txtScale.addListener(() {
      widget.area.pixelsInMeter = int.parse(txtScale.text);
    });
    txtImagePath.text = AdminInfo.area.imagePath;
    txtImagePath.addListener(() {
      widget.area.imagePath = txtImagePath.text;
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
    areaProvider = Provider.of<AreasProvider>(context, listen: false);
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

  Future<void> onSave() async {
    await areaProvider.addOrUpdate(widget.area);
    Navi.pop(context);
  }
}
