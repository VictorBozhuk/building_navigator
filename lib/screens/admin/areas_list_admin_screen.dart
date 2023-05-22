import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/area_model.dart';
import '../../models/vertex_model.dart';
import '../../navigation/navi.dart';
import '../../providers/areas_provider.dart';
import '../../providers/vertexes_provider.dart';
import '../widgets/app_bars/app_bars.dart';
import '../widgets/cards_list/area_card.dart';
import '../widgets/containers/main_container.dart';
import '../widgets/indicators/background_indicator.dart';
import '../widgets/lists/list_separated.dart';
import 'add_area_screen.dart';
import 'area_admin_screen.dart';

class AreasListAdminScreen extends StatefulWidget{
  late bool isSelectAreaConnection;
  AreasListAdminScreen({super.key, this.isSelectAreaConnection = false});

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
          Navi.push(context, AddAreaScreen(area: Area.empty()));
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
    return areas = await areaProvider.getAllWithCollections();
  }

  Widget getItemBuilder(int index){
    return AreaCard(
        area: areas[index],
        onTap: ()
        {
          if(widget.isSelectAreaConnection == false){
            Navi.push(context, AreaAdminScreen(area: areas[index]));
          } else {
            Navi.pushReplacement(context, AreaAdminScreen(
                area: areas[index],
                isSelectAreaConnection: widget.isSelectAreaConnection)
            );
          }
        }
    );
  }
}
