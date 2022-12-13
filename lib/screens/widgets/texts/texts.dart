import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';

class NewText extends StatelessWidget {
  final String text;
  const NewText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyleMainNormalText);
  }
}