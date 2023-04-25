import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_room_admin_screen.dart';

import '../../navigation/app_router.gr.dart';
import '../../navigation/navi.dart';
import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/list_tile_wt_s.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/lists/list_separated.dart';

class RoomsListAdminScreen extends StatefulWidget {
  const RoomsListAdminScreen({super.key});

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
                length: AdminInfo.selectedVertex!.rooms!.length,
              ),
            ],
          ),
        )
    );
  }

  Widget getItemBuilder(int index){
    return ListTileWTS(
      title: AdminInfo.selectedVertex!.rooms![index].title,
      leadingIcon: Icon(Icons.room, color: Theme.of(context).iconTheme.color),
      onTap: () {
        AdminInfo.clearRoom();
        AdminInfo.room = AdminInfo.selectedVertex!.rooms![index];
        Navi.push(context, PanoramaRoomAdminRoute(
            panoramaImagePath: AdminInfo.selectedVertex!.panoramaImagePath!,
            room: AdminInfo.room,
            isCreate: false));
      },
    );
  }

  void onAppBarAdd(){
    AdminInfo.clearRoom();
    AdminInfo.room.vertex = AdminInfo.selectedVertex!;
    Navi.push(context, PanoramaRoomAdminRoute(
      panoramaImagePath: AdminInfo.selectedVertex!.panoramaImagePath!,
      isCreate: true,
      room: AdminInfo.room,)
    );
  }

}

