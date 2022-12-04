import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/area_model.dart';
import '../../models/building_model.dart';
import '../../services/database.dart';
import '../widgets/building_widgets.dart';
import '../widgets/drawer/navigation_drawer.dart';
import '../widgets/global/appBars.dart';
import 'add_area_screen.dart';
import 'add_building.dart';
import 'add_vertexes_to_area_screen.dart';
import 'list_vertexes.dart';

class ListAreasAdminScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: getAppBarWithIcon("Зони", () => {
          AdminInfo.clearArea(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddAreaScreen(isCreate: true)))
        }),
        body: Container(
            height: _screenHeight,
            width: _screenWidth,
            decoration: BoxDecoration(
              image: AppImages.backgroundImage,
            ),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                // list view to show images and list count
                child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      itemBuilder: (BuildContext, index){
                        return GestureDetector(
                          child: Card(
                              color: Colors.transparent,
                              child: Container(
                                color: Colors.indigo.withOpacity(0.7),
                                child: Column(
                                    children: [
                                      Container(
                                          child:
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            child: Image(fit: BoxFit.fitWidth, image: NetworkImage(AdminInfo.building.areas[index].imagePath)),)
                                      ),
                                      Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15))),
                                          margin: EdgeInsets.only(top: 10, bottom: 10),
                                          child:
                                          Text(AdminInfo.building.areas[index].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600))
                                      )

                                    ]
                                ) ,
                              )

                          ),
                          onTap: () =>
                          {
                            if(AdminInfo.isCreateAreaConnection != true){
                              AdminInfo.clearArea(),
                              AdminInfo.area = AdminInfo.building.areas[index],
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AddVertexesToAreaScreen()))
                            }
                            else {
                              AdminInfo.areaConnection = AdminInfo.building.areas[index],
                              AdminInfo.selectedVertex?.area = AdminInfo.building.areas[index].getObject(),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListVertexesScreen()))
                            }

                          },
                        );
                      },
                      itemCount: AdminInfo.building.areas.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                    ),
                )
            ),
    );
  }
}
