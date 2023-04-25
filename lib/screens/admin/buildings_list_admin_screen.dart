import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../services/database.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/building_card.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/drawer/navigation_drawer.dart';
import '../widgets/indicators/background_indicator.dart';
import '../widgets/lists/list_separated.dart';
import 'add_building_screen.dart';

class BuildingsListAdminScreen extends StatefulWidget{

  BuildingsListAdminScreen({super.key});

  @override
  State<BuildingsListAdminScreen> createState() => _BuildingsListAdminScreenState();
}

class _BuildingsListAdminScreenState extends State<BuildingsListAdminScreen> {
  late List<Building> buildings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Buildings", context, onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddBuildingScreen()))
        }),
        drawer: const NewNavigationDrawer(),
        body: FutureBuilder<List<Building>>(
            future: getBuildings(),
            builder: (context, AsyncSnapshot<List<Building>> snapshot) {
              if (snapshot.hasData) {
                return MainContainer(
                    child: Padding(padding: const EdgeInsets.only(top: 5), child:
                    ListSeparated(
                      itemBuilder: getItemBuilder,
                      length: buildings.length,
                    ),
                    )
                );
              } else {
                return const BackgroundIndicator();
              }
            }
        )
    );
  }

  Future<List<Building>> getBuildings() async {
    return buildings = await DatabaseService.getAll();
  }

  Widget getItemBuilder(int index){
    return BuildingCard(
        building: buildings[index],
        onTap: () =>
        {
          AdminInfo.clearBuilding(),
          AdminInfo.building = buildings[index],
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddBuildingScreen()))
        }
    );
  }
}
