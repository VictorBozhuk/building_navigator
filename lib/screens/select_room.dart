import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';

import '../Style/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/room_model.dart';

class SelectRoomScreen extends StatefulWidget {
  SelectRoomScreen({required this.building, required this.isSource, required this.func});
  final Building building;
  final bool isSource;
  final Function func;

  @override
  State<StatefulWidget> createState() => SelectRoomScreenState(building: building, isSource: isSource, func: func);
}

class SelectRoomScreenState extends State<SelectRoomScreen> {

  SelectRoomScreenState({required this.building, required this.isSource, required this.func}){
    rooms = getRoomsOfBuilding(building);
  }
  final Building building;
  final bool isSource;
  late List<Room> rooms;
  final Function func;
  TextEditingController txtSelectedRoom = TextEditingController(text: "");
  _changeSelectedRoom(String text){
    setState(() => {
      if(isSource) {
        PathInfo.setSource(getRoomByTitle(rooms, text))
      }
      else {
        PathInfo.setDestination(getRoomByTitle((rooms), text))
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var rooms = getRoomsOfBuilding(building);

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
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
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
                    if(isSource) {
                      PathInfo.setSource(rooms[index])
                    }
                    else {
                      PathInfo.setDestination(rooms[index])
                    },
                    func(),
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
    var vertexes = building.vertexes.where((x) => x.rooms != null).toList();
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

