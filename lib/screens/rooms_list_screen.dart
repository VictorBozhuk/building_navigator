import 'package:flutter/material.dart';
import 'package:lnu_navigator/providers/areas_provider.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/cards_list/list_tile_wt_s.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/main_text_input.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/search_text_field.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/text_input.dart';
import 'package:provider/provider.dart';

import '../navigation/navi.dart';
import '../styles/images.dart';
import '../styles/text_styles/text_styles.dart';
import '../models/room_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';

class RoomsListScreen extends StatefulWidget {
  const RoomsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RoomsListScreenState();
}

class _RoomsListScreenState extends State<RoomsListScreen> {
  late AreasProvider areaProvider;
  late List<Room> allRooms;
  late List<Room> rooms;
  TextEditingController txtRoom = TextEditingController();
  @override
  void initState() {
    txtRoom.addListener(() {
      setState(() {
        rooms = allRooms.where((r) => r.title.toLowerCase().contains(txtRoom.text.toLowerCase())).toList();
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
    areaProvider = Provider.of<AreasProvider>(context, listen: false);
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
    return rooms = allRooms = areaProvider.allRooms; // need await
  }

  Widget getItemBuilder(int index){
    return ListTileWTS(
      leadingIcon: Icon(Icons.room, color: Theme.of(context).iconTheme.color),
      title: rooms[index].title,
      onTap: () => onTap(index),
    );
  }

  void onTap(int index){
    areaProvider.destination = rooms[index];
    areaProvider.setPath();
    Navi.pop(context);
    //Navi.popAndPushReplacement(context, AreaRoute());
  }
}
