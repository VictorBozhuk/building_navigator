import 'package:flutter/material.dart';

import '../../../models/path_model.dart';
import '../../../models/user_info.dart';
import '../../../styles/appTheme.dart';
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
      child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: AppTheme.imageBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),),
              child: Image(fit: BoxFit.fitWidth, image: NetworkImage(building.imagePath)),
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppTheme.buttonColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child:
                Center(child: Text(building.title,
                    style: textStyleCardTitle))
            )
          ]
      ),
      onTap: () => onTap(),
    );
  }
}