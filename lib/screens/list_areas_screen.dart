import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/app_bars/app_bars.dart';
import 'package:lnu_navigator/screens/widgets/lists/widgets_of_lists.dart';

import '../../styles/images.dart';
import '../models/path_model.dart';
import '../models/user_info.dart';
import 'area_screen.dart';

class ListAreasScreen extends StatelessWidget{
  const ListAreasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Areas", context),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: AppImages.backgroundImage,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (buildContext, index){
                return GestureDetector(
                  child: AreaCard(UserInfo.building.areas[index]),
                  onTap: () =>
                  {
                    PathInfo.isWalk = true,
                    UserInfo.area = UserInfo.building.areas[index],
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AreaScreen()))
                  },
                );
              },
              itemCount: UserInfo.building.areas.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
          )
      ),
    );
  }
}
