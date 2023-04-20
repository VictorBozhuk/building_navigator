import 'package:flutter/material.dart';

import '../../styles/images.dart';
import '../../models/admin_info.dart';
import '../widgets/app_bars/app_bars.dart';
import 'add_vertex_screen.dart';

class ListVertexesAdminScreen extends StatefulWidget {
  const ListVertexesAdminScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListVertexesAdminScreenState();
}

class _ListVertexesAdminScreenState extends State<ListVertexesAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithIcon("Vertexes of ${AdminInfo.areaConnection.title}", context, onTap: () => {
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
                itemBuilder: (buildContext, index){
                  return ListTile(
                    leading: const Icon(Icons.room, color: Colors.white,),
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
                separatorBuilder: (buildContext,index)
                {
                  return const Divider(height: 1);
                },
                itemCount: AdminInfo.areaConnection.vertexes!.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              ),
              )
            ],
          ),
        )
    );
  }
}

