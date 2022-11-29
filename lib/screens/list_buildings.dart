import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/building_widgets.dart';
import 'package:lnu_navigator/screens/widgets/drawer/navigation_drawer.dart';
import '../Style/images.dart';
import '../data/globals.dart';
import '../models/building_model.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import '../services/database.dart';
import 'building.dart';

class ListBuildingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    pointRadius = 392.72727272727275 / 55;
    pictureWidth = 392.72727272727275;
    pictureHeight = 523.6363636363636;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: getAppBar("Будівлі"),
        drawer: const NavigationDrawer(),
        body: Container(
          height: _screenHeight,
          width: _screenWidth,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              // list view to show images and list count
              child: StreamBuilder<QuerySnapshot>(
                stream: DatabaseService.getBuildingSnapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(),
                    itemBuilder: (BuildContext, index){
                      Building building = Building.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
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
                                          child: Image(fit: BoxFit.fitWidth, image: NetworkImage(building.imagePath)),)
                                    ),
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(15))),
                                        margin: EdgeInsets.only(top: 10, bottom: 10),
                                        child:
                                        Text(building.title,
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
                          UserInfo.building = building,
                          PathInfo.building = building,
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BuildingPage()))},
                      );
                    },
                    itemCount:  snapshot.data?.docs.length ?? 0,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5),
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
