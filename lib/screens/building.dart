import 'package:flutter/material.dart';
import 'package:lnu_navigator/models/user_info.dart';
import 'package:lnu_navigator/screens/panorama_screen.dart';
import 'package:lnu_navigator/screens/select_room.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import '../Style/images.dart';
import '../models/path_model.dart';
import 'find_path.dart';
import 'list_areas_screen.dart';

class BuildingPage extends StatelessWidget {

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
                title: 'Пошук приміщення',
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                func: () {
                  PathInfo.clear();
                  PathInfo.isWalk = false;
                  //PathInfo.nextVertexImagePath = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => FindPathPage(building: UserInfo.building)));}),
            ProfileItemButton(
                title: 'Всі карти',
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                func: () => {
                  PathInfo.isWalk = true,
                  PathInfo.clear(),
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => ListAreasScreen()))}),
          ],
        ),
      )
    );
  }
}

