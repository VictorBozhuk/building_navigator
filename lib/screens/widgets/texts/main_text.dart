import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/texts/texts.dart';

class MainText extends StatelessWidget {
  final String text;
  const MainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 20,
          margin: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NewText(text: text)
            ],
          ),
      );
  }
}