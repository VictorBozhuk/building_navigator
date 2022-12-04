import 'package:flutter/material.dart';

class IconOfItemOnBuildingPage extends StatelessWidget{
  const IconOfItemOnBuildingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.arrow_forward, color: Colors.white, size: 30);
  }
}

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
    return Container(
      margin: const EdgeInsets.only(top:5, bottom: 5),
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        onPressed: () => func(),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          fixedSize: const Size.fromHeight(48),
          primary: Colors.indigo.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ Text(title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
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
      ),
    );
  }
}
