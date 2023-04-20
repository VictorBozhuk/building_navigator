import 'package:flutter/material.dart';

import '../../../styles/decorations/decorations.dart';
import 'helper/edit_and_delete_icon_group.dart';

class CardOfEditAndDelete extends StatelessWidget {
  final String title;
  final Function onEdit;
  final Function onDelete;
  const CardOfEditAndDelete({super.key,
    required this.title,
    required this.onEdit,
    required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:10, right: 10, top: 2.5, bottom: 2.5),
      decoration: MainDecoration.getListTileDecoration(context),
      child: ListTile(
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        trailing: EditAndDeleteIconGroup(onEdit: onEdit, onDelete: onDelete),
      ),
    );
  }
}
