import 'package:flutter/material.dart';


class CardOfDrawer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const CardOfDrawer({super.key,
    required this.title,
    required this.icon,
    required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      onTap: () => onTap(),
    );
  }
}
