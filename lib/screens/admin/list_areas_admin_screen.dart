import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../widgets/global/appBars.dart';
import '../widgets/lists/widgets_of_lists.dart';
import 'add_area_screen.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_vertexes_admin_screen.dart';

class ListAreasAdminScreen extends StatelessWidget{
  const ListAreasAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Areas", () => {
          AdminInfo.clearArea(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddAreaScreen(isCreate: true)))
        }),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: AppImages.backgroundImage,
            ),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      itemBuilder: (buildContext, index){
                        return GestureDetector(
                          child: AreaCard(AdminInfo.building.areas[index]),
                          onTap: () =>
                          {
                            if(AdminInfo.isCreateAreaConnection == false){
                              AdminInfo.clearArea(),
                              AdminInfo.area = AdminInfo.building.areas[index],
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddVertexesToAreaScreen()))
                            }
                            else {
                              AdminInfo.areaConnection = AdminInfo.building.areas[index],
                              AdminInfo.selectedVertex?.areaConnection = AdminInfo.building.areas[index].getObject(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ListVertexesAdminScreen()))
                            }
                          },
                        );
                      },
                      itemCount: AdminInfo.building.areas.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                    ),
                )
            ),
    );
  }
}
