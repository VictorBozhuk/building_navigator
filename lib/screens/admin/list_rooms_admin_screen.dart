import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/panorama_room_admin_screen.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/lists/widgets_of_lists.dart';
import 'add_room_screen.dart';

class ListRoomsAdminScreen extends StatefulWidget {
  const ListRoomsAdminScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListRoomsAdminScreenState();
}

class _ListRoomsAdminScreenState extends State<ListRoomsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Rooms", context, onTap: () => {
          AdminInfo.clearRoom(),
          AdminInfo.room.vertex = AdminInfo.selectedVertex!,
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  PanoramaRoomAdminScreen(
                    panoramaImagePath: AdminInfo.selectedVertex!.panoramaImagePath!,
                    isCreate: true,
                    room: AdminInfo.room,)))
        }),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Column(
            children: [
              Expanded(child:
              ListView.separated(
                itemBuilder: (buildContext, index){
                  return buildRoomCard(AdminInfo.selectedVertex!.rooms![index],  () => {
                    AdminInfo.clearRoom(),
                    AdminInfo.room = AdminInfo.selectedVertex!.rooms![index],
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            PanoramaRoomAdminScreen(
                                panoramaImagePath: AdminInfo.selectedVertex!.panoramaImagePath!,
                                room: AdminInfo.room,
                                isCreate: false))),
                  });
                },
                separatorBuilder: (buildContext,index)
                {
                  return const Divider(height: 1);
                },
                itemCount: AdminInfo.selectedVertex!.rooms!.length,
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

