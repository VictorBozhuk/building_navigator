import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/area_model.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/cards_list/area_card.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';

import '../../styles/images.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';
import 'find_path.dart';

class ListAreasScreen extends StatefulWidget{

  ListAreasScreen({super.key});

  @override
  State<ListAreasScreen> createState() => _ListAreasScreenState();
}

class _ListAreasScreenState extends State<ListAreasScreen> {
  late List<Area> areas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Areas", context,
            onTap: () {
              PathInfo.clear();
              PathInfo.isWalk = false;
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) => FindPathPage(building: UserInfo.building)));
            },
            icon: Icons.search
        ),
        body: FutureBuilder<List<Area>>(
            future: getAreas(),
            builder: (context, AsyncSnapshot<List<Area>> snapshot) {
              if (snapshot.hasData) {
                return MainContainer(
                    child: Padding(padding: const EdgeInsets.only(top: 5), child:
                    ListSeparated(
                      itemBuilder: getItemBuilder,
                      length: areas.length,
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

  Future<List<Area>> getAreas() async {
    return areas = UserInfo.building.areas;
  }

  Widget getItemBuilder(int index){
    return AreaCard(
        area: areas[index],
        onTap: () =>
        {
          PathInfo.isWalk = true,
          UserInfo.area = UserInfo.building.areas[index],
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AreaScreen()))

        }
    );
  }
}

