import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  final String text;
  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:10, bottom: 10),
        child: Text(text, style: Theme.of(context).textTheme.headlineLarge,),
      ),
    );
  }

}