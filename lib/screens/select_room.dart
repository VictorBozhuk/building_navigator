import 'package:building_navigator/screens/find_path.dart';
import 'package:flutter/material.dart';

import '../algorithm/building_navigator.dart';
import '../loader/dormitory_3/vertexes_dormitory_3.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/room_model.dart';

class SelectRoomPage extends StatefulWidget {
  SelectRoomPage({required this.building, required this.isSource});
  final Building building;
  final bool isSource;
  @override
  State<StatefulWidget> createState() => SelectRoomPageState(building: building, isSource: isSource);
}

class SelectRoomPageState extends State<SelectRoomPage> {

  SelectRoomPageState({required this.building, required this.isSource}){
    rooms = getRoomsOfBuilding(building);
  }
  final Building building;
  final bool isSource;
  late List<Room> rooms;
  TextEditingController txt = TextEditingController(text: "");
  _changeName(String text){
    setState(() => {
      if(isSource) {
        PathInfo.setSource(getRoomByTitle((rooms), text))
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
      appBar: AppBar(title: const Text('fd')),
      body: Column(
        children: [
          TextFormField(
              controller: txt,
              style: const TextStyle(fontSize: 22),
              onChanged: _changeName),
          ElevatedButton(onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FindPathPage(building: building))),
              child: const Text("select")),
          Expanded(child:
            ListView.builder(
              itemBuilder: (BuildContext, index){
                return GestureDetector(
                  child: Card(
                      child: Text(rooms[index].Title,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600))),
                  onTap: () => {
                    if(isSource) {
                      PathInfo.setSource(rooms[index])
                    }
                    else {
                      PathInfo.setDestination(rooms[index])
                    },
                    setState(() {
                      txt.text = rooms[index].Title;
                  }),
                  },
                );
              },
              itemCount: rooms.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            )
          )
        ],
      )
    );
  }

  List<Room> getRoomsOfBuilding(Building building)
  {
    var vertexes = building.vertexes.where((x) => x.Rooms != null).toList();
    var rooms = <Room>[];
    for(int i = 0; i < vertexes.length; ++i)
    {
      var length = vertexes[i].Rooms?.length ?? 0;

      for(int j = 0; j < length; ++j)
      {
        rooms.add(vertexes[i].Rooms![j]);
      }
    }
    return rooms;
  }




  Room? getRoomByTitle(List<Room> rooms, String title){
    for(int i = 0; i < rooms.length; ++i)
    {
      if(title == rooms[i].Title)
        {
          return rooms[i];
        }
    }
    return null;
  }

}

