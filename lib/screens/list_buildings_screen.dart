import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import 'package:lnu_navigator/screens/widgets/global/appBars.dart';
import 'package:lnu_navigator/screens/widgets/lists/widgets_of_lists.dart';
import '../styles/images.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../services/database.dart';
import 'building_screen.dart';

class ListBuildingsPage extends StatelessWidget{
  const ListBuildingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: getAppBar("Buildings"),
        drawer: const NavigationDrawer(),
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
                          UserInfo.building = building,
                          PathInfo.building = building,
                          Navigator.push(context,MaterialPageRoute(builder:
                              (context) => const BuildingPage()))},
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
