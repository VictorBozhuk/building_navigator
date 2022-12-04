import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';

import '../../Style/images.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';

class ListAreasScreen extends StatelessWidget{
  const ListAreasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Карти"),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                                    child: Image(fit: BoxFit.fitWidth, image: NetworkImage(UserInfo.building.areas[index].imagePath)),)
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15))),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child:
                                  Text(UserInfo.building.areas[index].title,
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
                    PathInfo.isWalk = true,
                    UserInfo.area = UserInfo.building.areas[index],
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AreaScreen()))
                  },
                );
              },
              itemCount: UserInfo.building.areas.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
          )
      ),
    );
  }
}
