import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/main_text_input.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/text_input.dart';

import '../styles/images.dart';
import '../styles/text_styles/text_styles.dart';
import '../models/path_model.dart';
import '../models/room_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';
import 'functions/functions.dart';

class ListRoomsScreen extends StatefulWidget {
  const ListRoomsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListRoomsScreenState();
}

class _ListRoomsScreenState extends State<ListRoomsScreen> {
  late List<Room> rooms;
  _ListRoomsScreenState(){
    rooms = getRoomsOfBuildingByTitle(UserInfo.building, '');
  }

  TextEditingController txtSelectedRoom = TextEditingController();
  _changeSelectedRoom(String text){
    setState(() => {
      rooms = getRoomsOfBuildingByTitle(UserInfo.building, text),
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Rooms", context),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Column(
            children: [
              MainTextInput(
                  inputController: txtSelectedRoom,
                  hint: "Room",
                  label: "",
                  onChanged: _changeSelectedRoom
              ),
              Expanded(child:
                ListView.separated(
                  itemBuilder: (buildContext, index){
                    return ListTile(
                      leading: const Icon(Icons.room, color: Colors.white,),
                      title: Text(rooms[index].title,
                          style: textStyleListOfTitles),
                      onTap: () => {
                        PathInfo.isWalk = false,
                        PathInfo.setDestination(rooms[index]),
                        PathInfo.setPath(PathInfo.building),
                        Navigator.pop(context),
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AreaScreen())),
                      },
                    );
                  },
                  separatorBuilder: (buildContext,index) => const Divider(height: 1),
                  itemCount: rooms.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        )
    );
  }
}
