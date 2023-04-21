import 'package:flutter/material.dart';

import '../../../styles/decorations/decorations.dart';
import '../../functions/defaults.dart';

class ListTileWTS extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Function onTap;
  final Function onLongPress;
  const ListTileWTS({super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    this.onLongPress = defaultFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MainDecoration.getListTileDecoration(context),
      child: ListTile(
        leading: leadingIcon,
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        onTap: () => onTap(),
        onLongPress: () => onLongPress(),
      ),);
  }
}
