import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/buttons/main_button.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/paddings/main_padding.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/add_text_input.dart';

import '../navigation/navi.dart';
import '../models/vertex_model.dart';
import 'admin/rooms_list_admin_screen.dart';
import 'rooms_list_screen.dart';

class SelectRoomsScreen extends StatefulWidget{
  const SelectRoomsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SelectRoomsScreenState();
}

class _SelectRoomsScreenState extends State<SelectRoomsScreen> {
  String sourceRoomTitle = '';

  TextEditingController txtSource = TextEditingController();
  TextEditingController txtDestination = TextEditingController();

  @override
  void initState() {
    txtSource.addListener(() {
      sourceRoomTitle = txtSource.text;
    });
    txtDestination.addListener(() {
      //PathInfo.destinationRoom?.title = txtDestination.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    txtSource.dispose();
    txtDestination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Find room', context),
      body: MainContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddInput(inputController: txtSource, hint: "Current room", onSuffixTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoomsListScreen()))),
            AddInput(inputController: txtDestination, hint: "Destination room", onSuffixTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoomsListScreen()))),
            MainPadding(child:
              MainButton(title: "Search", onPressed: () async {
                //await setPath(widget.building);
                //Navi.push(context, PanoramaScreen(
                //    currentVertex: PathInfo.currentVertex!,
                //    nextVertex: PathInfo.destinationRoom!.vertex));
              },),
            ),
          ],),
      )
    );
  }
}

