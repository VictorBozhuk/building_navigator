import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';
import '../../../styles/decorations/decorations.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon leadingIcon;
  final Function onTap;
  final Function onLongPress;
  const MainCard({super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.onTap,
    required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MainDecoration.getListTileDecoration(context),
      child: ListTile(
        leading: Padding(padding: const EdgeInsets.only(top: 10), child:
          leadingIcon
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.headlineSmall),
        onTap: () => onTap(),
        onLongPress: () => onLongPress(),
      ),
    );
  }
}