import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/user_info.dart';
import 'package:lnu_navigator/screens/widgets/building/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';
import '../Style/images.dart';
import '../models/path_model.dart';
import 'find_path.dart';
import 'list_areas_screen.dart';

class BuildingPage extends StatelessWidget {
  const BuildingPage({super.key});

  void loadAllImages() async {
    for(int i = 0 ; i < UserInfo.building.vertexes.length; ++i){
      UserInfo.building.vertexes[i].loadImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    loadAllImages();
    return Scaffold(
      appBar: getAppBar(UserInfo.building.title),
      body: Container(
        decoration: BoxDecoration(
          image: AppImages.backgroundImage,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),),
                margin: const EdgeInsets.only(bottom: 5),
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: Image(fit: BoxFit.fitWidth,
                        image: NetworkImage(UserInfo.building.imagePath)))),
            ProfileItemButton(
                title: 'Search room',
                icon: const IconOfItemOnBuildingPage(),
                func: () {
                  PathInfo.clear();
                  PathInfo.isWalk = false;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => FindPathPage(building: UserInfo.building)));}),
            ProfileItemButton(
                title: 'All areas',
                icon: const IconOfItemOnBuildingPage(),
                func: () => {
                  PathInfo.isWalk = true,
                  PathInfo.clear(),
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => const ListAreasScreen()))}),
          ],
        ),
      )
    );
  }
}

