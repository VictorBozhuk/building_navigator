import 'package:flutter/material.dart';

import '../../../models/path_model.dart';
import '../../admin/list_buildings_admin.dart';
import '../../list_buildings.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        )
    ),

  );

  Widget buildHeader(BuildContext context) => Container(
    height: 200,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/DrawerLogo.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child:        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(
          height: 130,
          width: 130,
          color: Colors.white.withOpacity(0.8),
          image: AssetImage("assets/NB.png"),
          fit: BoxFit.cover,
        ),]),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading:  const Icon(Icons.home_outlined),
            title: Text('Buildings', style: styleText,),
            onTap: () =>{
              //PathInfo.clear(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBuildingsPage()))}
          ),
          ListTile(
            leading:  const Icon(Icons.image_search),
            title: Text('Room search', style: styleText,),
            onTap: (){},
          ),
          ListTile(
            leading:  const Icon(Icons.admin_panel_settings),
            title: Text('Admin', style: styleText),
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBuildingsAdminScreen()));},
          ),
        ],
      ));
}

var styleText = TextStyle(fontSize: 18);