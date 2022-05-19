import 'package:flutter/material.dart';


class ProfileItemButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function func;
  const ProfileItemButton(
      {Key? key,
        required this.title,
        required this.icon,
        required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _contentWidth = MediaQuery.of(context).size.width - 40;
    return Container(
      margin: const EdgeInsets.only(top:5, bottom: 5),
      width: _contentWidth,
      child: ElevatedButton(
        onPressed: () => func(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ Text(title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            height: 1)),
                    icon,
              ],
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          fixedSize: const Size.fromHeight(48),
          primary: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

AppBar getAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600)),
  );
}
