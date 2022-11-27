import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../models/vertex_model.dart';
import '../widgets/building_widgets.dart';
import 'add_room.dart';
import 'add_vertex.dart';

class ListRoomsScreen extends StatefulWidget {
  ListRoomsScreen({required this.vertex});
  final Vertex vertex;
  @override
  State<StatefulWidget> createState() => ListRoomsScreenState(vertex: vertex);
}

class ListRoomsScreenState extends State<ListRoomsScreen> {

  ListRoomsScreenState({required this.vertex}) {
  }
  final Vertex vertex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAdminAppBar("Приміщення", () => {
          AdminInfo.clearRoom(),
          AdminInfo.room.vertexTitle = vertex.title.toString(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRoomScreen(vertex: vertex, isCreate: true, index: 0,)))
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
                    title: Text(vertex.rooms![index].title,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onTap: () => {
                      AdminInfo.clearRoom(),
                      AdminInfo.room = vertex.rooms![index],
                      AdminInfo.room.vertexTitle = vertex.title.toString(),
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddRoomScreen(vertex: vertex, isCreate: false, index: index,))),
                    },
                  );
                },
                separatorBuilder: (BuildContext,index)
                {
                  return Divider(height: 1);
                },
                itemCount: vertex.rooms?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              ),
              )
            ],
          ),
        )


    );
  }



}

