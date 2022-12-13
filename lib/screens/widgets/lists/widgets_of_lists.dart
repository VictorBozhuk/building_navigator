import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';
import '../../../models/area_model.dart';
import '../../../models/building_model.dart';
import '../../../models/room_model.dart';


class BuildingCard extends StatelessWidget {
  final Building _building;
  const BuildingCard( this._building, {super.key});

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
                    topRight: Radius.circular(10),),
                  child: Image(fit: BoxFit.fitWidth,
                    image: NetworkImage(_building.imagePath),),),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(_building.title,
                        style: textStyleCardTitle),),
              ]
          ) ,
        )
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

class RoomCard extends StatelessWidget {
  final Room room;
  final Function onTap;
  const RoomCard(this.room, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.room, color: Colors.white,),
      title: Text(room.title, style: textStyleListOfTitles),
      onTap: onTap()
    );
  }
}