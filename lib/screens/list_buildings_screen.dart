import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';
import 'package:lnu_navigator/screens/widgets/lists/widgets_of_lists.dart';
import '../styles/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../services/database.dart';
import 'building_screen.dart';

class ListBuildingsPage extends StatefulWidget{

  ListBuildingsPage({super.key});

  @override
  State<ListBuildingsPage> createState() => _ListBuildingsPageState();
}

class _ListBuildingsPageState extends State<ListBuildingsPage> {
  late List<Building> buildings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar("Buildings", context),
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
        UserInfo.building = buildings[index],
        PathInfo.building = buildings[index],
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => const BuildingPage()))}
      );
  }
}