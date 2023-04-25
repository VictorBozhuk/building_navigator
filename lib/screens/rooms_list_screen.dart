import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/cards_list/list_tile_wt_s.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/main_text_input.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/search_text_field.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/text_input.dart';

import '../navigation/navi.dart';
import '../styles/images.dart';
import '../styles/text_styles/text_styles.dart';
import '../models/path_model.dart';
import '../models/room_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';
import 'functions/functions.dart';

class RoomsListScreen extends StatefulWidget {
  const RoomsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RoomsListScreenState();
}

class _RoomsListScreenState extends State<RoomsListScreen> {
  late List<Room> rooms;
  TextEditingController txtRoom = TextEditingController();
  @override
  void initState() {
    rooms = getRoomsOfBuildingByTitle(UserInfo.building, '');
    txtRoom.addListener(() {
      setState(() => {
        rooms = getRoomsOfBuildingByTitle(UserInfo.building, txtRoom.text),
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    txtRoom.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Rooms", context),
        body: MainContainer(
          child: Column(
            children: [
              SearchInput(inputController: txtRoom, hint: "Search",),
              Expanded(child: FutureBuilder<List<Room>>(
                  future: getRooms(),
                  builder: (context, AsyncSnapshot<List<Room>> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(padding: const EdgeInsets.only(top: 5), child:
                        ListSeparated(
                          itemBuilder: getItemBuilder,
                          length: rooms.length,
                        ),
                      );
                    } else {
                      return const BackgroundIndicator();
                    }
                  }
                )
              )
            ],
          ),
        )
    );
  }

  Future<List<Room>> getRooms() async {
    return rooms;
  }

  Widget getItemBuilder(int index){
    return ListTileWTS(
      leadingIcon: Icon(Icons.room, color: Theme.of(context).iconTheme.color),
      title: rooms[index].title,
      onTap: () => onTap(index),
    );
  }

  void onTap(int index){
    PathInfo.isWalk = false;
    PathInfo.setDestination(rooms[index]);
    PathInfo.setPath(PathInfo.building);
    Navi.popAndPushReplacement(context, AreaRoute());
  }
}
