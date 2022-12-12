import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../../services/database.dart';
import '../widgets/drawer/navigation_drawer.dart';
import '../widgets/global/appBars.dart';
import '../widgets/lists/widgets_of_lists.dart';
import 'add_building_screen.dart';

class ListBuildingsAdminScreen extends StatelessWidget{
  const ListBuildingsAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: getAppBarWithIcon("Buildings", () => {
          AdminInfo.clear(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddBuildingScreen()))
        }),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: AppImages.backgroundImage,
            ),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: DatabaseService.getBuildingSnapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (buildContext, index){
                        Building building = Building.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
                        return GestureDetector(
                          child: BuildingCard(building),
                          onTap: () =>
                          {
                            AdminInfo.clearBuilding(),
                            AdminInfo.building = building,
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AddBuildingScreen()))},
                        );
                      },
                      itemCount:  snapshot.data?.docs.length ?? 0,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                    );
                  },
                )
            )
        ),
      ),
    );
  }
}
