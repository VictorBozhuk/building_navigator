import 'package:flutter/material.dart';

import '../../../styles/text_styles/text_styles.dart';

AppBar getAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: textStyleAppBar),
  );
}

AppBar getAppBarWithIcon(String title, Function func, {IconData icon = Icons.add}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: textStyleAppBar),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              func();
            },
            child: Icon(
              icon,
              size: 35.0,
            ),
          )
      ),
    ],

  );
}
