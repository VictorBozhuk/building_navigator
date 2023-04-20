import 'package:flutter/material.dart';

import '../../../styles/decorations/decorations.dart';

class CardOfDelete extends StatelessWidget {
  final String title;
  final Function onDelete;
  const CardOfDelete({super.key,
    required this.title,
    required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:5, right: 5),
      decoration: MainDecoration.getListTileDecoration(context),
      child: ListTile(
        trailing: IconButton(icon: const Icon(Icons.close, size: 30), onPressed: () => onDelete()),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),);
  }
}
