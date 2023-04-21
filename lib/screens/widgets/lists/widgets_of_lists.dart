import 'package:flutter/material.dart';

import '../../../models/path_model.dart';
import '../../../models/user_info.dart';
import '../../../styles/text_styles/text_styles.dart';
import '../../../models/area_model.dart';
import '../../../models/building_model.dart';
import '../../../models/room_model.dart';


class BuildingCard extends StatelessWidget {
  final Building building;
  late Function onTap;
  BuildingCard({super.key, required this.building, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
          color: Colors.transparent,
          child: Container(
            color: Colors.indigo.withOpacity(0.7),
            child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),),
                    child: Image(fit: BoxFit.fitWidth,
                      image: NetworkImage(building.imagePath),),),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(building.title,
                        style: textStyleCardTitle),),
                ]
            ) ,
          )
      ),
      onTap: () => onTap(),
    );


  }
}

class AreaCard extends StatelessWidget {
  final Area _area;
  const AreaCard( this._area, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        child: Container(
          color: Colors.indigo.withOpacity(0.7),
          child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(fit: BoxFit.fitWidth, image: NetworkImage(_area.imagePath)),),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child:
                    Text(_area.title,
                        style: textStyleCardTitle)
                )
              ]
          ) ,
        )
    );
  }
}

ListTile buildRoomCard(Room room, Function onTap) {
  return ListTile(
    leading: const Icon(Icons.room, color: Colors.white,),
    title: Text(room.title, style: textStyleListOfTitles),
    onTap: () {onTap();},
  );
}