import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../widgets/global/appBars.dart';
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
        appBar: getAppBarWithIcon("Rooms", () => {
          AdminInfo.clearRoom(),
          AdminInfo.room.vertex = AdminInfo.selectedVertex!,
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRoomScreen(isCreate: true)))
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
                  return RoomCard(AdminInfo.selectedVertex!.rooms![index], () => {
                    AdminInfo.clearRoom(),
                    AdminInfo.room = AdminInfo.selectedVertex!.rooms![index],
                    AdminInfo.room.vertexTitle = AdminInfo.selectedVertex!.title.toString(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddRoomScreen(isCreate: false))),
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

