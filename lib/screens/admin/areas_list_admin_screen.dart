import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/admin/select_vertex_screen.dart';

import '../../models/area_model.dart';
import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/area_card.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/indicators/background_indicator.dart';
import '../widgets/lists/list_separated.dart';
import 'add_area_screen.dart';
import 'area_admin_screen.dart';
import 'vertexes_list_admin_screen.dart';

class AreasListAdminScreen extends StatefulWidget{

  AreasListAdminScreen({super.key});

  @override
  State<AreasListAdminScreen> createState() => _AreasListAdminScreenState();
}

class _AreasListAdminScreenState extends State<AreasListAdminScreen> {
  late List<Area> areas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Areas", context, onTap:  () => {
          AdminInfo.clearArea(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddAreaScreen(isCreate: true)))
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
    return areas = AdminInfo.building.areas;
  }

  Widget getItemBuilder(int index){
    return AreaCard(
        area: areas[index],
        onTap: () =>
        {
          if(AdminInfo.isCreateAreaConnection == false){
            AdminInfo.clearArea(),
            AdminInfo.area = AdminInfo.building.areas[index],
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AreaAdminScreen()))
          }
          else {
            AdminInfo.areaConnection = AdminInfo.building.areas[index],
            AdminInfo.selectedVertex?.areaConnection = AdminInfo.building.areas[index].getObject(),
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectVertexScreen(area: AdminInfo.areaConnection,))),
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const ListVertexesAdminScreen()))
          }
        }
    );
  }
}
