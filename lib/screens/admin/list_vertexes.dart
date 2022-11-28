import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../widgets/building_widgets.dart';
import 'add_vertex.dart';

class ListVertexesScreen extends StatefulWidget {
  ListVertexesScreen({required this.building});
  final Building building;
  @override
  State<StatefulWidget> createState() => ListVertexesScreenState(building: building);
}

class ListVertexesScreenState extends State<ListVertexesScreen> {

  ListVertexesScreenState({required this.building}){
  }
  final Building building;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAdminAppBar("Вершини", () => {
          AdminInfo.clearVertex(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddVertexScreen(isCreate: true)))
        }),
        body: Container(
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Column(
            children: [
              Expanded(child:
              ListView.separated(
                itemBuilder: (BuildContext, index){
                  return ListTile(
                    leading: Icon(Icons.room, color: Colors.white,),
                    title: Text(building.vertexes[index].title.toString(),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onTap: () => {
                      AdminInfo.clearVertex(),
                      AdminInfo.vertex = building.vertexes[index],
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddVertexScreen(isCreate: false)))
                    },
                  );
                },
                separatorBuilder: (BuildContext,index)
                {
                  return Divider(height: 1);
                },
                itemCount: building.vertexes.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              ),
              )
            ],
          ),
        )


    );
  }



}

