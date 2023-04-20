import 'package:flutter/material.dart';

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
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.background,
    ),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: const Center(child:
      Image(image: AssetImage("assets/EnglishHub.png"),
        fit: BoxFit.cover,),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          CardOfDrawer(
            title: "groups",
            icon: Icons.grid_view_rounded,
            onTap: () => {}),
        ],
      ));
}