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
    color: Colors.blue.shade700,
    height: 100,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading:  const Icon(Icons.home_outlined),
            title: const Text('Buildings'),
            onTap: () =>{
              //PathInfo.clear(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBuildingsPage()))}
          ),
          ListTile(
            leading:  const Icon(Icons.home_outlined),
            title: const Text('Room search'),
            onTap: (){},
          ),
          ListTile(
            leading:  const Icon(Icons.home_outlined),
            title: const Text('Admin'),
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBuildingsAdminScreen()));},
          ),
        ],
      ));
}