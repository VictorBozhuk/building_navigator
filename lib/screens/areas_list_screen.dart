import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/area_model.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/cards_list/area_card.dart';
import 'package:lnu_navigator/screens/widgets/containers/main_container.dart';
import 'package:lnu_navigator/screens/widgets/indicators/background_indicator.dart';
import 'package:lnu_navigator/screens/widgets/lists/list_separated.dart';
import 'package:provider/provider.dart';

import '../../styles/images.dart';
import '../models/building_model.dart';
import '../models/user_info.dart';
import '../navigation/navi.dart';
import '../providers/areas_provider.dart';
import '../services/area_service.dart';
import '../services/locator.dart';
import 'area_screen.dart';
import 'select_rooms_screen.dart';

class AreasListScreen extends StatefulWidget{
  final Building building;
  const AreasListScreen({super.key, required this.building});

  @override
  State<AreasListScreen> createState() => _AreasListScreenState();
}

class _AreasListScreenState extends State<AreasListScreen> {
  late AreasProvider areaProvider;
  late List<Area> areas;

  @override
  Widget build(BuildContext context) {
    areaProvider = Provider.of<AreasProvider>(context);
    return Scaffold(
        appBar: getAppBarWithIcon("Areas", context,
            onTap: () {
              Navi.push(context, SelectRoomsScreen(building: UserInfo.building));
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
    return areas = await areaProvider.getAllWithCollections(widget.building);
  }

  Widget getItemBuilder(int index){
    return AreaCard(
        area: areas[index],
        onTap: ()
        {
          Navi.push(context, AreaScreen(area: areas[index]));
        }
    );
  }
}

