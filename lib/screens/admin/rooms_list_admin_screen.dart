import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_room_admin_screen.dart';

import '../../models/room_model.dart';
import '../../models/vertex_model.dart';
import '../../navigation/navi.dart';
import '../../styles/images.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/list_tile_wt_s.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/lists/list_separated.dart';

class RoomsListAdminScreen extends StatefulWidget {
  late Vertex vertex;
  RoomsListAdminScreen({super.key, required this.vertex});

  @override
  State<StatefulWidget> createState() => _RoomsListAdminScreenState();
}

class _RoomsListAdminScreenState extends State<RoomsListAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Rooms", context, onTap: onAppBarAdd),
        body: MainContainer(
          child: Column(
            children: [
              ListSeparated(
                itemBuilder: getItemBuilder,
                length: widget.vertex.rooms.length,
              ),
            ],
          ),
        )
    );
  }

  Widget getItemBuilder(int index){
    return ListTileWTS(
      title: widget.vertex.rooms[index].title,
      leadingIcon: Icon(Icons.room, color: Theme.of(context).iconTheme.color),
      onTap: () {
        //
        // перевірки чи всі змінні на місці
        //
        Navi.pushThenAction(context, PanoramaRoomAdminScreen(
          vertex: widget.vertex,
          room: widget.vertex.rooms[index],),
        action: () => setState(() {}));
      },
    );
  }

  void onAppBarAdd(){
    Navi.pushThenAction(context,
      PanoramaRoomAdminScreen(
        vertex: widget.vertex,
        room: Room.empty(widget.vertex.id),),
      action: () => setState(() {})
    );
  }

}

