import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';

class NewSwitch extends StatelessWidget{
  final Function(bool) onChanged;
  late bool value;
  late String title;
  NewSwitch({super.key, required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Text(title, style: textStyleMainNormalText),
       Switch(
         trackColor: MaterialStateProperty.all(Colors.black38),
         activeColor: Colors.green.withOpacity(0.4),
         inactiveThumbColor: Colors.blueGrey.shade600,
         inactiveTrackColor: Colors.grey.shade400,
         value: value,
         onChanged: (value) => onChanged(value),
       ),
     ],
   );
  }
}