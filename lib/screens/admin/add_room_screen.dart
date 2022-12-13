import 'package:flutter/material.dart';

import '../../styles/images.dart';
import '../../styles/text_styles/text_styles.dart';
import '../../models/admin_info.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/global/appBars.dart';
import '../widgets/text_inputs/main_text_input.dart';
import 'panorama_admin_screen.dart';
import '../widgets/building_widgets.dart';
import 'list_rooms_admin_screen.dart';

class AddRoomScreen extends StatefulWidget{
  AddRoomScreen({super.key, required this.isCreate}){
    AdminInfo.setSize(AdminInfo.room.title);
  }
  final bool isCreate;
  @override
  State<StatefulWidget> createState() => AddRoomScreenState();
}

class AddRoomScreenState extends State<AddRoomScreen> {
  TextEditingController txtTitle = TextEditingController(text: AdminInfo.room.title);
  TextEditingController txtX = TextEditingController(text: AdminInfo.room.titleX.toString());
  TextEditingController txtY = TextEditingController(text: AdminInfo.room.titleY.toString());
  TextEditingController txtDirection = TextEditingController(text: AdminInfo.room.direction.toString());

  _changeTitle(String text){
    setState(() => {
      AdminInfo.setSize(text),
      AdminInfo.room.title = text});
  }
  _changeX(String text){
    setState(() => AdminInfo.room.titleX = double.parse(text));
  }
  _changeY(String text){
    setState(() => AdminInfo.room.titleY = double.parse(text));
  }
  _changeDirection(String text){
    setState(() => AdminInfo.room.direction = double.parse(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Rooms'),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainTextInput(
                inputController: txtTitle,
                hint: "Title",
                label: AdminInfo.room.title,
                onChanged: _changeTitle,
              ),
              MainTextInput(
                inputController: txtX,
                hint: "X",
                label: AdminInfo.room.titleX.toString(),
                onChanged: _changeX,
              ),
              MainTextInput(
                inputController: txtY,
                hint: "Y",
                label: AdminInfo.room.titleY.toString(),
                onChanged: _changeY,
              ),
              MainTextInput(
                inputController: txtDirection,
                hint: "Direction",
                label: AdminInfo.room.direction.toString(),
                onChanged: _changeDirection,
              ),
              MainButton(
                title: "Set coordinates",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          PanoramaAdminScreen(panoramaImagePath:
                            AdminInfo.selectedVertex!.panoramaImagePath!,
                            isRoom: true,
                            currentWidget:
                              Text(AdminInfo.room.title,
                                style: textStyleRoomTitleOnPanorama),
                            isCreate: widget.isCreate,
                            index: 0),
                      ));
                },
              ),
              MainButton(
                title: "Save",
                onPressed: () {
                  if(widget.isCreate == true){
                    AdminInfo.selectedVertex!.rooms ??= [];
                    AdminInfo.selectedVertex!.rooms?.add(AdminInfo.room);
                  }
                  else{
                    var room = AdminInfo.selectedVertex!.rooms!.firstWhere((x) => x.uid == AdminInfo.room.uid);
                    room.title = AdminInfo.room.title;
                    room.titleX = AdminInfo.room.titleX;
                    room.titleY = AdminInfo.room.titleY;
                    room.direction = AdminInfo.room.direction;
                  }
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                      const ListRoomsAdminScreen()));
                }
              ),
            ],
          ),
          )
        )
    );
  }
}


