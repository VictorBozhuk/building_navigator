import 'package:flutter/material.dart';

import '../../Style/images.dart';
import '../../models/admin_info.dart';
import '../../models/building_model.dart';
import '../widgets/building_widgets.dart';
import 'add_vertex.dart';

class ListVertexesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListVertexesScreenState();
}

class ListVertexesScreenState extends State<ListVertexesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAdminAppBar("Вершини ${AdminInfo.areaConnection.title}", () => {
          AdminInfo.clearVertex(),
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddVertexScreen()))
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
                    title: Text(AdminInfo.areaConnection.vertexes![index].title.toString(),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onTap: () => {
                      AdminInfo.selectedVertexOnOtherArea = AdminInfo.areaConnection.vertexes![index],
                      Navigator.pop(context),
                      Navigator.pop(context),
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => AddVertexScreen()))
                    },
                  );
                },
                separatorBuilder: (BuildContext,index)
                {
                  return Divider(height: 1);
                },
                itemCount: AdminInfo.areaConnection.vertexes!.length,
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

