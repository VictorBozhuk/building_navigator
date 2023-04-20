import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_room_admin_screen.dart';

import '../../styles/images.dart';
import '../../styles/text_styles/text_styles.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/buttons/main_button.dart';
import '../widgets/text_inputs/main_text_input.dart';
import 'panorama_vertex_admin_screen.dart';
import '../widgets/building_widgets.dart';
import 'list_rooms_admin_screen.dart';

class AddRoomScreen extends StatefulWidget{
  AddRoomScreen({super.key, required this.isCreate});
  final bool isCreate;
  @override
  State<StatefulWidget> createState() => AddRoomScreenState();
}

class AddRoomScreenState extends State<AddRoomScreen> {
  TextEditingController txtTitle = TextEditingController(text: AdminInfo.room.title);

  _changeTitle(String text){
    setState(() => {
      AdminInfo.room.title = text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Editing room', context),
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
              MainButton(
                title: "Set coordinates",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          PanoramaRoomAdminScreen(panoramaImagePath:
                            AdminInfo.selectedVertex!.panoramaImagePath!,
                            room: AdminInfo.room,
                            isCreate: widget.isCreate,),
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


