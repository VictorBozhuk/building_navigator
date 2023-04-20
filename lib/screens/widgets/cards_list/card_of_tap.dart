import 'package:flutter/material.dart';

import '../../../styles/decorations/decorations.dart';

class CardOfTap extends StatelessWidget {
  final String title;
  final Function onTap;
  const CardOfTap({super.key,
    required this.title,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left:5, right: 5),
        decoration: MainDecoration.getListTileDecoration(context),
        child: ListTile(
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          onTap: () => onTap(),
        ));
  }
}
