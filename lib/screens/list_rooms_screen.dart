import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';

import '../Style/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/room_model.dart';
import '../models/user_info.dart';
import '../models/vertex_model.dart';
import 'area_screen.dart';

class ListRoomsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListRoomsScreenState();
}

class ListRoomsScreenState extends State<ListRoomsScreen> {
  ListRoomsScreenState(){
    rooms = getRoomsOfBuilding(UserInfo.building);
  }
  late List<Room> rooms;
  TextEditingController txtSelectedRoom = TextEditingController(text: "");
  _changeSelectedRoom(String text){
    setState(() => {
      PathInfo.setDestination(getRoomByTitle(rooms, text))
    });
  }
  @override
  Widget build(BuildContext context) {
    var rooms = getRoomsOfBuilding(UserInfo.building);

    return Scaffold(
        appBar: getAppBar("Всі приміщення"),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child:       Column(
            children: [
              Container(
                height: 60,
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txtSelectedRoom,
                    decoration: InputDecoration(
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                        hintText: "Приміщення",
                        suffixIcon: IconButton(
                          onPressed: () => txtSelectedRoom.clear(),
                          icon: const Icon(Icons.clear, color: Colors.white,),
                          iconSize: 40,
                        )
                    ),
                    style: const TextStyle(fontSize: 22, color: Colors.white),

                    onChanged: _changeSelectedRoom),
              ),
              Expanded(child:
              ListView.separated(

                itemBuilder: (BuildContext, index){
                  return ListTile(
                    leading: Icon(Icons.room, color: Colors.white,),
                    title: Text(rooms[index].title,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onTap: () => {
                      PathInfo.setDestination(rooms[index]),
                      PathInfo.setPath(PathInfo.building),
                      Navigator.pop(context),
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AreaScreen())),
                    },
                  );
                },
                separatorBuilder: (BuildContext,index)
                {
                  return Divider(height: 1);
                },
                itemCount: rooms.length,
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

  List<Room> getRoomsOfBuilding(Building building)
  {
    List<Vertex> vertexes = [];
    for(int i = 0; i < building.areas.length; ++i){
      vertexes.addAll(building.areas[i].vertexes!.where((x) => x.rooms != null));
    }
    List<Room> rooms = <Room>[];
    for(int i = 0; i < vertexes.length; ++i)
    {
      var length = vertexes[i].rooms?.length ?? 0;

      for(int j = 0; j < length; ++j)
      {
        rooms.add(vertexes[i].rooms![j]);
      }
    }
    rooms.sort((a, b) => a.title.compareTo(b.title));
    return rooms;
  }

  Room? getRoomByTitle(List<Room> rooms, String title){
    for(int i = 0; i < rooms.length; ++i)
    {
      if(title == rooms[i].title)
      {
        return rooms[i];
      }
    }
    return null;
  }

}

