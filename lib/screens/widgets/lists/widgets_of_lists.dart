import 'package:flutter/material.dart';

import '../../../Style/text_styles/splash_screen_text_styles.dart';
import '../../../models/building_model.dart';


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
                        style: textStyleBuildingCardTitle),),
              ]
          ) ,
        )
    );
  }
}