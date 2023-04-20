import 'package:flutter/material.dart';

import '../../../../styles/appTheme.dart';

class EditAndDeleteIconGroup extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;
  const EditAndDeleteIconGroup({super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 50,
      child: Row(children: [
        GestureDetector(
          onTap: () => onEdit(),
          child: const Icon(Icons.edit, color: AppTheme.iconColorDark,),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        GestureDetector(
          onTap: () => onDelete(),
          child: const Icon(Icons.delete, color: AppTheme.iconColorDark,),
        )
      ],),
    );
  }
}
