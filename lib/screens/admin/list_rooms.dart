import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import '../widgets/building_widgets.dart';
import 'add_room.dart';
import 'add_vertex.dart';

class ListRoomsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListRoomsScreenState();
}

class ListRoomsScreenState extends State<ListRoomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAdminAppBar("Приміщення", () => {
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
                itemBuilder: (BuildContext, index){
                  return ListTile(
                    leading: Icon(Icons.room, color: Colors.white,),
                    title: Text(AdminInfo.selectedVertex!.rooms![index].title,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onTap: () => {
                      AdminInfo.clearRoom(),
                      AdminInfo.room = AdminInfo.selectedVertex!.rooms![index],
                      AdminInfo.room.vertexTitle = AdminInfo.selectedVertex!.title.toString(),
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddRoomScreen(isCreate: false))),
                    },
                  );
                },
                separatorBuilder: (BuildContext,index)
                {
                  return Divider(height: 1);
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

