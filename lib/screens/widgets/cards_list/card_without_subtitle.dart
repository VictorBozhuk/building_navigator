import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';
import '../../../styles/decorations/decorations.dart';

class CardWithoutSubtitle extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Function onTap;
  final Function onLongPress;
  const CardWithoutSubtitle({super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MainDecoration.getListTileDecoration(context),
      child: ListTile(
        leading: Padding(padding: const EdgeInsets.only(top: 10),
          child: leadingIcon,),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        onTap: () => onTap(),
        onLongPress: () => onLongPress(),
      ),);
  }
}
