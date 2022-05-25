import 'package:building_navigator/screens/panorama_screen.dart';
import 'package:building_navigator/screens/select_room.dart';
import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:building_navigator/services/database.dart';
import 'package:flutter/material.dart';
import '../Style/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import 'find_path.dart';

class BuildingPage extends StatelessWidget {
  final Building building;

  const BuildingPage({Key? key, required this.building});

  void loadAllImages() async {
    for(int i = 0 ; i < building.vertexes.length; ++i){
      building.vertexes[i].loadImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    loadAllImages();
    return Scaffold(
      appBar: getAppBar(building.title),
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
                        image: NetworkImage(building.imagePath)))),
            ProfileItemButton(
                title: 'Пошук приміщення',
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                func: () {
                  PathInfo.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => FindPathPage(building: building)));}),
            ProfileItemButton(
                title: 'Всі приміщення',
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                func: () => {Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => SelectRoomScreen(building: building, isSource: true, func: () =>
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) =>
                                PanoramaScreen(panoramaImagePath: PathInfo.getVertexImagePath(), nextVertexImagePath: "",))),)))}),
          ],
        ),
      )
    );
  }
}

