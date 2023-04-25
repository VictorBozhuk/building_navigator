import 'package:flutter/material.dart';

import '../../../navigation/app_router.gr.dart';
import '../../../navigation/navi.dart';
import '../cards_list/card_of_drawer.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: Theme.of(context).colorScheme.primary,
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
    height: 150,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/DrawerLogo.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Center(child:
      Image(
        height: 130,
        width: 130,
        color: Colors.white.withOpacity(0.8),
        image: const AssetImage("assets/NB.png"),
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          CardOfDrawer(
            title: "Buildings",
            icon: Icons.home_work_outlined,
            onTap: () => Navi.push(context, BuildingsListRoute())),
          CardOfDrawer(
              title: "Room search",
              icon: Icons.room,
              onTap: () => { }),
          CardOfDrawer(
              title: "Admin",
              icon: Icons.admin_panel_settings,
              onTap: () => Navi.push(context, BuildingsListAdminRoute())),
        ],
      ));
}