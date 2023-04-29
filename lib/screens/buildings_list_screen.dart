import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/navigation/app_router.gr.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/cards_list/building_card.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/drawer/app_drawer.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';
import '../navigation/navi.dart';
import '../services/building_servce.dart';
import '../services/locator.dart';
import '../styles/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../services/database.dart';
import 'areas_list_screen.dart';

class BuildingsListScreen extends StatefulWidget {

  BuildingsListScreen({super.key});

  @override
  State<BuildingsListScreen> createState() => _BuildingsListScreenState();
}

class _BuildingsListScreenState extends State<BuildingsListScreen> {
  late List<Building> buildings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Buildings", context),
        drawer: AppDrawer(),
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
    return buildings = await getIt<BuildingService>().getAll();
  }

  Widget getItemBuilder(int index){
    return BuildingCard(
      building: buildings[index],
      onTap: ()
      {
        UserInfo.building = buildings[index];
        PathInfo.building = buildings[index];
        PathInfo.isWalk = true;
        PathInfo.clear();
        Navi.push(context, AreasListRoute(building: buildings[index]));
      }
    );
  }
}