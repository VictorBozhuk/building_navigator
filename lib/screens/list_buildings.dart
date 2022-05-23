import 'package:building_navigator/screens/widgets/building_widgets.dart';
import 'package:flutter/material.dart';
import '../Style/app_colors.dart';
import '../Style/images.dart';
import '../loader/loader.dart';
import '../models/path_model.dart';
import 'building.dart';

class ListBuildingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: getAppBar("Будівлі"),
        body: Container(
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
                                        child: Image(fit: BoxFit.fitWidth, image: AssetImage(buildings[index].imagePath)),)
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(15))),
                                      margin: EdgeInsets.only(top: 10, bottom: 10),
                                      child:
                                      Text(buildings[index].title,
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
                        PathInfo.building = buildings[index],
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuildingPage(building: buildings[index])))},
                    );
                  },
                  itemCount: buildings.length,
                  shrinkWrap: true,

                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                ),
              )
          ),
        ),
      );
  }
}