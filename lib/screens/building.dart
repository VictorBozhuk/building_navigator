import 'package:flutter/material.dart';
import '../models/building_model.dart';
import 'find_path.dart';

class BuildingPage extends StatelessWidget {
  final Building building;

  const BuildingPage({Key? key, required this.building});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dyn"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(fit: BoxFit.fitWidth, image: AssetImage(building.imagePath)),
          ElevatedButton(
              onPressed: () => {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FindPathPage(building: building)))},
              child: Text('Find path')
          ),
        ],
      ),
    );
  }
}

