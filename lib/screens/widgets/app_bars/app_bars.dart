import 'package:flutter/material.dart';

import '../../../navigation/navi.dart';


AppBar getAppBar(String title, BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navi.pop(context),
    ),
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
  );
}

AppBar getAppBarWithDrawer(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
  );
}

AppBar getAppBarWithoutBackButton(String title, BuildContext context) {
  return AppBar(
    leading: Container(),
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
  );
}

AppBar getAppBarWithIcon(String title, BuildContext context, {required Function onTap, IconData icon = Icons.add}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navi.pop(context),
    ),
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => onTap(),
            child: Icon(
              icon,
              size: 30.0,
            ),
          )
      ),
    ],

  );
}

AppBar getAppBarWithTwoIcons(String title, BuildContext context,
    {required Function onTapFirst, IconData firstIcon = Icons.delete,
      required Function onTapSecond, IconData secondIcon = Icons.edit_note}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navi.pop(context),
    ),
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => onTapFirst(),
            child: Icon(
              firstIcon,
              size: 30.0,
            ),
          )
      ),
      Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () => onTapSecond(),
            child: Icon(
              secondIcon,
              size: 30.0,
            ),
          )
      ),
    ],

  );
}

AppBar getAppBarWithoutBackButtonAndWithIcon(String title, BuildContext context, {required Function onTap, IconData icon = Icons.add}) {
  return AppBar(
    leading: Container(),
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => onTap(),
            child: Icon(
              icon,
              size: 30.0,
            ),
          )
      ),
    ],

  );
}

AppBar getAppBarWithDrowerAndIcon(String title, BuildContext context,
    { required Function onTap, IconData icon = Icons.add}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              onTap();
            },
            child: Icon(
              icon,
              size: 30.0,
            ),
          )
      ),
    ],
  );
}
