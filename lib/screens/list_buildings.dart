import 'package:flutter/material.dart';
import '../Style/app_colors.dart';
import '../loader/loader.dart';
import '../models/path_model.dart';
import 'building.dart';

class ListByuldingsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.backgroundColor,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic Add Image List"),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          // list view to show images and list count
          child: ListView.builder(
            itemBuilder: (BuildContext, index){
              return GestureDetector(
                child: Card(
                    child:
                    Column(
                        children: [
                          Container(child: Image(fit: BoxFit.fitWidth, image: AssetImage(buildings[index].imagePath)),),
                          Text(buildings[index].title,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600))
                        ]
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
          )
          ),
        ),
      );
  }

}