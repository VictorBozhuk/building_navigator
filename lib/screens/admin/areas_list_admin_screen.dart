import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/select_vertex_screen.dart';
import 'package:provider/provider.dart';

import '../../models/area_model.dart';
import '../../models/building_model.dart';
import '../../navigation/app_router.gr.dart';
import '../../navigation/navi.dart';
import '../../providers/areas_provider.dart';
import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/area_card.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/indicators/background_indicator.dart';
import '../widgets/lists/list_separated.dart';
import 'add_area_screen.dart';
import 'area_admin_screen.dart';

class AreasListAdminScreen extends StatefulWidget{
  late Building building;
  late bool isSelectAreaConnection;
  AreasListAdminScreen({super.key, required this.building, required this.isSelectAreaConnection});

  @override
  State<AreasListAdminScreen> createState() => _AreasListAdminScreenState();
}

class _AreasListAdminScreenState extends State<AreasListAdminScreen> {
  late AreasProvider areaProvider;
  late List<Area> areas;

  @override
  Widget build(BuildContext context) {
    areaProvider = Provider.of<AreasProvider>(context);
    return Scaffold(
        appBar: getAppBarWithIcon("Areas", context, onTap:  () {
          AdminInfo.clearArea();
          Navi.push(context, AddAreaRoute(area: Area.empty(widget.building.id)));
        }),
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
    return areas = await areaProvider.getAll(widget.building.id);
  }

  Widget getItemBuilder(int index){
    return AreaCard(
        area: areas[index],
        onTap: ()
        {
          if(widget.isSelectAreaConnection == false){
            AdminInfo.clearArea();
            AdminInfo.area = AdminInfo.building.areas[index];
            Navi.push(context, AreaAdminRoute(area: areas[index]));
          } else {
            AdminInfo.areaConnection = AdminInfo.building.areas[index];
            AdminInfo.selectedVertex?.areaConnection = AdminInfo.building.areas[index].copy();
            Navi.push(context, SelectVertexRoute(area: AdminInfo.areaConnection,));
          }
        }
    );
  }
}
